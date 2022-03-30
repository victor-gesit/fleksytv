//
//  APIServer.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation

class APIServer: APIServerProtocol {
    func getTopRatedTVShows(completion: @escaping ([TVShow]?, AppError?) -> Void) {
        //
    }
    
    func getTvShowDetail(completion: @escaping (TVShow, AppError?) -> Void) {
        //
    }
    
    func getSimilarTVShows(tvId: String, completion: @escaping ([TVShow]?, AppError?) -> Void) {
        //
    }
    
    func getGenres(completion: @escaping ([Genre], AppError?) -> Void) {
        //
    }
    
    func getConfiguration(completion: @escaping (Configuration, AppError?) -> Void) {
        //
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
            urlString += "?api-key=\(apiKey)"
        case .unauthenticated:
            break;
            // Do nothing
        }
        guard let url = URL(string: route.description) else { return nil }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
    }
}
