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
    
    struct ENV {
        static let apiKey = "api-key"
    }
}

