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
}

extension APIRoutes: CustomStringConvertible {
    var description: String {
        switch self {
        case .topRatedTVShows: return Constants.BaseURL + "tv/top_rated"
        case .tvShowDetail(let tvId): return Constants.BaseURL + "/tv/\(tvId)"
        case .similarTVShows(let tvId): return Constants.BaseURL + tvId + "/tv/similar"
        case .genres: return Constants.BaseURL + "genre/movie/list"
        case .configuration: return Constants.BaseURL + "configuration"
        }
    }
    
    struct Constants {
        static let BaseURL = "https://api.themoviedb.org/3/"
    }
}
