//
//  APIRoutes.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

enum APIRoute {
    case topRatedTVShows(Int)
    case tvShowDetail(String)
    case similarTVShows(String, Int)
    case genres
    case configuration
    case loadPicture(String, ImageQuality)
}

extension APIRoute: CustomStringConvertible {
    var description: String {
        switch self {
        case .topRatedTVShows(let pageNumber):
            return Constants.BaseURL + "tv/top_rated" + "?page=\(pageNumber)"
        case .tvShowDetail(let tvId): return Constants.BaseURL + "tv/\(tvId)"
        case .similarTVShows(let tvId, let pageNumber):
            return Constants.BaseURL + "/tv/\(tvId)/similar" + "?page=\(pageNumber)"
        case .genres: return Constants.BaseURL + "genre/movie/list"
        case .configuration: return Constants.BaseURL + "configuration"
        case .loadPicture(let path, let quality):
            if let baseUrl = UserDefaults.standard.imageDBConfiguration?.images.baseUrl {
                return baseUrl + "\(quality.rawValue)\(path)"
            } else {
                return "https://image.tmdb.org/t/p/original/wwemzKWzjKYJFfCeiB57q3r4Bcm.png"
            }
        }
    }
    
    struct Constants {
        static let BaseURL = "https://api.themoviedb.org/3/"
    }
}

enum ImageQuality: String {
    case original
    case w500
}

enum AppError: Error {
    case missingConfigCache
    case noInternet
}

enum Method: String {
    case `get` = "GET"
    case post = "POST"
    case put = "PUT"
    case `delete` = "DELETE"
}

enum AuthMethod {
    case authenticated
    case unauthenticated
}
