//
//  TopRatedTVShowsResponse.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

struct TopRatedTVShowsResponse: Codable {
    var page: Int
    var results: [TVShow]
    var totalPages: Int
    var totalResults: Int
}
