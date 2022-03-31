//
//  TVShow.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

struct TVShow: Codable, Identifiable {
    var posterPath: String?
    var backdropPath: String?
    var name: String?
    var overview: String?
    var voteAverage: Float?
    var firstAirDate: String?
    var genreIds: [Int]
    var id: Int
}

extension TVShow {
    var genres: [String] {
        guard let allGenres = UserDefaults.standard.allGenres else {
            return []
        }
        let genres: [String] = self.genreIds.compactMap { id in
            let genre = allGenres["\(id)"]
            return genre?.name
        }
        return genres
    }
}

#if DEBUG
extension TVShow {
    static let dummyTVShow = TVShow(posterPath: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 1)
    static let dummyTVShows: [TVShow] = [
        TVShow(posterPath: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 1),
        TVShow(posterPath: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 2),
        TVShow(posterPath: "/7q448EVOnuE3gVAx24krzO7SNXM.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 3),
        TVShow(posterPath: "/z0iCS5Znx7TeRwlYSd4c01Z0lFx.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 4),
        TVShow(posterPath: "/qG59J1Q7rpBc1dvku4azbzcqo8h.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 5),
        TVShow(posterPath: "/q8eejQcg1bAqImEV8jh8RtBD4uH.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 6),
        TVShow(posterPath: "/ohGz4HDYGTite1GmRhRuBMVAn03.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 7),
        TVShow(posterPath: "/xxv8Ibs8Anni6qrWkAf60rDsPCu.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 8),
        TVShow(posterPath: "/xxv8Ibs8Anni6qrWkAf60rDsPCu.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 9),
        TVShow(posterPath: "/xxv8Ibs8Anni6qrWkAf60rDsPCu.jpg", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank from the river until it became a valley.", voteAverage: 2.5, firstAirDate: "2019-01-11", genreIds: [1, 2], id: 10)
    ]
}
#endif
