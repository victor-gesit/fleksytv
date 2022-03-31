//
//  Configuration.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

struct Configuration: Codable {
    var images: ImageConfiguration
    var changeKeys: [String]
}

#if DEBUG
extension Configuration {
    static let dummyConfiguration = Configuration(images: .dummyConfiguration, changeKeys: [])
}
#endif

struct ImageConfiguration: Codable {
    var baseUrl: String
    var secureBaseUrl: String
    var backdropSizes: [String]
    var logoSizes: [String]
    var posterSizes: [String]
    var stillSizes: [String]
}

#if DEBUG
extension ImageConfiguration {
    static let dummyConfiguration = ImageConfiguration(baseUrl: "https://image.tmdb.org/t/p/", secureBaseUrl: "https://image.tmdb.org/t/p/", backdropSizes: [], logoSizes: [], posterSizes: [], stillSizes: [])
}
#endif

class SnakeCaseDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
