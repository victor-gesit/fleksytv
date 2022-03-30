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
        APIServer().getTopRatedTVShows { shows, error in
        }
        
        APIServer().getGenres { genres, error in
        }
        
        APIServer().getConfiguration { configuration, error in
        }
        
        APIServer().getSimilarTVShows(tvId: "") { shows, error in
        }
        
        APIServer().getTvShowDetail { show, error in
        }
        
        // Fetch The Movie DB Genres and Configuration
        return true
    }
}
