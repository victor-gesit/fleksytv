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
}

extension APIRoutes: CustomStringConvertible {
    var description: String {
        switch self {
        case .topRatedTVShows: return Constants.BaseURL + "top_rated"
        case .tvShowDetail(let tvId): return Constants.BaseURL + tvId
        case .similarTVShows(let tvId): return Constants.BaseURL + tvId + "/similar"
        }
    }
    
    struct Constants {
        static let BaseURL = "https://api.themoviedb.org/3/tv/"
    }
}
