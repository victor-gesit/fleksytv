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
            UserDefaults.standard.allGenres = genres
        }
        
        APIServer().getConfiguration { configuration, error in
            UserDefaults.standard.imageDBConfiguration = configuration
        }
        return true
    }
}
