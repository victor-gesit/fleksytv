//
//  String+Extensions.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation

extension String {
    var containsQuery: Bool {
        return self.contains("?")
    }
    
    var yearFromDateString: String {
        let strategy = Date.ParseStrategy(format: "\(year: .defaultDigits)-\(month: .twoDigits)-\(day: .twoDigits)", timeZone: .current)
        guard let date = try? Date(self, strategy: strategy) else { return "no-year" }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: date)
        guard let year = components.year else { return "no-year" }
        return "\(year)"
    }
    
    struct ENV {
        static let apiKey = "api-key"
    }
    
    func imageURLWith(_ quality: ImageQuality) -> URL? {
        let urlString = APIRoute.loadPicture(self, quality)
        let url = URL(string: urlString.description)
        return url
    }
}

