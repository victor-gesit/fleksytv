//
//  APIServer.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation

class APIServer: APIServerProtocol {
    func getTopRatedTVShows(completion: @escaping ([TVShow]?, AppError?) -> Void) {
        makeAPICall(route: .topRatedTVShows, method: .get, authMethod: .authenticated, responseClass: TopRatedTVShowsResponse.self) { result, error in
            let res = result?.results
            print("Shows ", res)
        }
    }
    
    func getTvShowDetail(completion: @escaping (TVShow, AppError?) -> Void) {
        makeAPICall(route: .tvShowDetail("20477"), method: .get, authMethod: .authenticated, responseClass: TVShow.self) { res, error in
            print("Show Details ", res)
        }
    }
    
    func getSimilarTVShows(tvId: String, completion: @escaping ([TVShow]?, AppError?) -> Void) {
        makeAPICall(route: .similarTVShows("20477"), method: .get, authMethod: .authenticated, responseClass: TopRatedTVShowsResponse.self) { res, error in
            print("Similar Shows ", res)
        }
    }
    
    func getGenres(completion: @escaping ([Genre], AppError?) -> Void) {
        makeAPICall(route: .genres, method: .get, authMethod: .authenticated, responseClass: GetGenresResponse.self) { genres, error in
            print("Genres ", genres)
        }
    }
    
    func getConfiguration(completion: @escaping (Configuration, AppError?) -> Void) {
        makeAPICall(route: .configuration, method: .get, authMethod: .authenticated, responseClass: Configuration.self) { res, error in
            print("Configuration ", res)
        }
    }
    
    func loadPicture(imagePath: String, quality: ImageQuality) {
        //
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
            guard let apiKey = ProcessInfo.processInfo.environment["api-key"] else { return nil }
            urlString += "?api_key=\(apiKey)"
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
