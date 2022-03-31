//
//  APIServer.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation

class APIServer: APIServerProtocol {
    static let shared = APIServer()
    private init() {}
    
    private static let configuration = UserDefaults.standard.imageDBConfiguration
    
    func getTopRatedTVShows(pageNumber: Int = 1, completion: @escaping ([TVShow]?, Error?) -> Void) {
        makeAPICall(route: .topRatedTVShows(pageNumber), method: .get, authMethod: .authenticated, responseClass: TopRatedTVShowsResponse.self) { result, error in
            let tvShows = result?.results
            completion(tvShows, error)
        }
    }
    
    func getTvShowDetail(tvId: String, completion: @escaping (TVShow?, Error?) -> Void) {
        makeAPICall(route: .tvShowDetail(tvId), method: .get, authMethod: .authenticated, responseClass: TVShow.self) { tvShow, error in
            completion(tvShow, error)
        }
    }
    
    func getSimilarTVShows(tvId: String, pageNumber: Int = 1, completion: @escaping ([TVShow]?, Error?) -> Void) {
        makeAPICall(route: .similarTVShows(tvId, pageNumber), method: .get, authMethod: .authenticated, responseClass: TopRatedTVShowsResponse.self) { res, error in
            completion(res?.results, error)
        }
    }
    
    func getGenres(completion: @escaping ([Genre]?, Error?) -> Void) {
        makeAPICall(route: .genres, method: .get, authMethod: .authenticated, responseClass: GetGenresResponse.self) { genres, error in
            completion(genres?.genres, error)
        }
    }
    
    func getConfiguration(completion: @escaping (Configuration?, Error?) -> Void) {
        makeAPICall(route: .configuration, method: .get, authMethod: .authenticated, responseClass: Configuration.self) { configuration, error in
            completion(configuration, error)
        }
    }
    
    func getImageURL(imagePath: String, quality: ImageQuality, completion: @escaping (String) -> Void) {
        guard let _ = Self.configuration else {
            getConfiguration {configuration, error in
                UserDefaults.standard.imageDBConfiguration = configuration
                let route = APIRoute.loadPicture(imagePath, quality)
                completion(route.description)
            }
            return
        }
        let route = APIRoute.loadPicture(imagePath, quality)
        completion(route.description)
    }
    
    
    private func makeAPICall<T: Decodable>(route: APIRoute, method: Method, authMethod: AuthMethod, responseClass: T.Type, completion: @escaping (T?, Error?) -> Void) {
        guard let request = createRequestObject(route: route, method: method, authMethod: authMethod) else { return }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completion(nil, AppError.noInternet)
                return
            }
            
            let decoded = try? SnakeCaseDecoder().decode(responseClass.self, from: data)
            completion(decoded, error)
        }.resume()
    }
    
    private func createRequestObject(route: APIRoute, method: Method, authMethod: AuthMethod) -> URLRequest? {
        var urlString = route.description
        switch authMethod {
        case .authenticated:
            guard let apiKey = ProcessInfo.processInfo.environment[.ENV.apiKey] else { return nil }
            if urlString.containsQuery {
                urlString += "&api_key=\(apiKey)"
            } else {
                urlString += "?api_key=\(apiKey)"
            }
        case .unauthenticated:
            break;
            // Do nothing
        }
        guard let url = URL(string: urlString) else { return nil }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
