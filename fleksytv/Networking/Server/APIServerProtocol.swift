//
//  APIServerProtocol.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation

protocol APIServerProtocol {
    func getTopRatedTVShows(completion: @escaping ([TVShow]?, AppError?) -> Void)
    func getTvShowDetail(completion: @escaping (TVShow, AppError?) -> Void)
    func getSimilarTVShows(tvId: String, completion: @escaping ([TVShow]?, AppError?) -> Void)
    func getGenres(completion: @escaping ([Genre], AppError?) -> Void)
    func getConfiguration(completion: @escaping (Configuration, AppError?) -> Void)
    func loadPicture(imagePath: String, quality: ImageQuality)
}
