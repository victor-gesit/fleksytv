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
    static let testTVShow = TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 1)
    static let testTVShows: [TVShow] = [
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 1),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 2),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 3),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 4),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 5),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 6),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 7),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 8),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 9),
        TVShow(posterPath: "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/movie-poster-template-design-3fde07497ef159f8ba0617dee83d982e_screen.jpg?ts=1636997626", name: "Chuck Norris", overview: "Chuck Norris took a horse to a river. The horse drank the river into a valley", voteAverage: 2.5, firstAirDate: "1901", genreIds: [1, 2], id: 10)
    ]
}
#endif
