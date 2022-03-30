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

struct ImageConfiguration: Codable {
    var baseUrl: String
    var secureBaseUrl: String
    var backdropSizes: [String]
    var logoSizes: [String]
    var posterSizes: [String]
    var stillSizes: [String]
}

class SnakeCaseDecoder: JSONDecoder {
    override init() {
        super.init()
        keyDecodingStrategy = .convertFromSnakeCase
    }
}
