//
//  Font+Extensions.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import SwiftUI
import UIKit

enum FleksyFont: String {
    case axiformaSemibold = "Axiforma-SemiBold"
    case axiformaMedium = "Axiforma-Medium"
    case axiformaRegular = "Axiforma-Regular"
}

extension Font {
    static func custom(from fleksyFont: FleksyFont, size: CGFloat) -> Font {
        return Font.custom(fleksyFont.rawValue, size: size)
    }
}
