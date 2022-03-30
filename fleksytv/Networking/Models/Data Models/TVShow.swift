//
//  TVShow.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

struct TVShow: Codable {
    var posterPath: String?
    var name: String?
    var overview: String?
    var voteAverage: Float?
    var firstAirDate: String?
    var id: Int
}

#if DEBUG
extension TVShow {
    static let testTVShow = TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 1)
    static let testTVShows: [TVShow] = [
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 1),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 2),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 3),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 4),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 5),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 6),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 7),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 8),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 9),
        TVShow(posterPath: "testImageCover", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", id: 10)
    ]
}
#endif
