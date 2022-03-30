//
//  Image+Extensions.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI

enum FleksyImage: String {
    case star
    case logo
    case testImageCover
    case close
}

extension Image {
    static func from(_ fleksyImage: FleksyImage) -> Image {
        return Image(fleksyImage.rawValue)
    }
}
