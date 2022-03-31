//
//  UIAppDelegate.swift
//  fleksytv
//
//  Created by Victor Idongesit on 30/03/2022.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Fetch The Movie DB Genres and Configuration
        APIServer.shared.getGenres { genres, error in
            var allGenres: [String: Genre] = [:]
            genres?.forEach({ genre in
                allGenres["\(genre.id)"] = genre
            })
            UserDefaults.standard.allGenres = allGenres
        }
        APIServer.shared.getConfiguration { configuration, error in
            print("CCC ", configuration)
            UserDefaults.standard.imageDBConfiguration = configuration
        }
        return true
    }
}
