//
//  Color+Extensions.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation
import SwiftUI

enum FleksyColor: String {
    case fleksyBackground = "#19191f"
    case fleksyLightFont = "#D7D7D7"
    case fleksyWhite = "#FFFFFF"
    case fleksyGray = "#262a33"
    case fleksyLightGray = "#343a47"
}

extension UIColor {
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}

extension Color {
    static func from(_ fleksyColor: FleksyColor) -> Color {
        return Color(UIColor(fleksyColor.rawValue))
    }
}
