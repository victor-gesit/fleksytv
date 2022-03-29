//
//  UserDefaultsKey.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import Foundation

extension UserDefaults {
    private enum Keys: String {
        case imageDBConfiguration
    }
    
    var imageDBConfiguration: Configuration? {
        get {
            if let savedData = object(forKey: Keys.imageDBConfiguration.rawValue) as? Data {
                return try? JSONDecoder().decode(Configuration.self, from: savedData)
            }
            return nil
        }
        
        set {
            if newValue != nil,
                let encoded = try? JSONEncoder().encode(newValue) {
                set(encoded, forKey: Keys.imageDBConfiguration.rawValue)
            } else {
                removeObject(forKey: Keys.imageDBConfiguration.rawValue)
            }
        }
    }
}
