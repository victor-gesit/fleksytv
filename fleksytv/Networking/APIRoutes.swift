//
//  APIRoutes.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

enum APIRoutes {
    case topRatedTVShows
    case tvShowDetail(String)
    case similarTVShows(String)
    case genres
    case configuration
    case loadPicture(String, ImageQuality)
}

extension APIRoutes: CustomStringConvertible {
    var description: String {
        switch self {
        case .topRatedTVShows: return Constants.BaseURL + "tv/top_rated"
        case .tvShowDetail(let tvId): return Constants.BaseURL + "tv/\(tvId)"
        case .similarTVShows(let tvId): return Constants.BaseURL + tvId + "/tv/similar"
        case .genres: return Constants.BaseURL + "genre/movie/list"
        case .configuration: return Constants.BaseURL + "configuration"
        case .loadPicture(let path, let quality):
            if let baseUrl = UserDefaults.standard.imageDBConfiguration?.images.baseUrl {
                return baseUrl + "/\(quality.rawValue)/\(path)"
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
}
