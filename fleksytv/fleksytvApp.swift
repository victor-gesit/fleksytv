//
//  fleksytvApp.swift
//  fleksytv
//
//  Created by Victor Idongesit on 29/03/2022.
//

import SwiftUI

@main
struct fleksytvApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            TVShowsView()
        }
    }
}
