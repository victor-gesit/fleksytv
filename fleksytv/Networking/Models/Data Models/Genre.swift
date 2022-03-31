//
//  Genre.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

struct Genre: Codable {
    var id: Int
    var name: String
}

#if DEBUG
extension Genre {
    static let dummyGenre1 = Genre(id: 1, name: "Action")
    static let dummyGenre2 = Genre(id: 2, name: "Sci-Fi")
}
#endif
