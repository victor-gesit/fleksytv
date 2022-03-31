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
        APIServer().getGenres { genres, error in
            var allGenres: [String: Genre] = [:]
            genres?.forEach({ genre in
                allGenres["\(genre.id)"] = genre
            })
            UserDefaults.standard.allGenres = allGenres
            
            #if DEBUG
            let dummyGenres: [String: Genre] = [
                "1": Genre.dummyGenre1,
                "2": Genre.dummyGenre2
            ]
            UserDefaults.standard.allGenres = dummyGenres
            
            let dummyConfiguration: Configuration = .dummyConfiguration
            UserDefaults.standard.imageDBConfiguration = dummyConfiguration
            #endif
        }
        #if PROD
        APIServer().getConfiguration { configuration, error in
            UserDefaults.standard.imageDBConfiguration = configuration
        }
        #endif
        return true
    }
}
