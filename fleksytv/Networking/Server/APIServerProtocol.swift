//
//  APIServerProtocol.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation

protocol APIServerProtocol {
    func getTopRatedTVShows(completion: @escaping ([TVShow]?, Error?) -> Void)
    func getTvShowDetail(tvId: String, completion: @escaping (TVShow?, Error?) -> Void)
    func getSimilarTVShows(tvId: String, completion: @escaping ([TVShow]?, Error?) -> Void)
    func getGenres(completion: @escaping ([Genre]?, Error?) -> Void)
    func getConfiguration(completion: @escaping (Configuration?, Error?) -> Void)
    func getImageURL(imagePath: String, quality: ImageQuality) -> String
}
