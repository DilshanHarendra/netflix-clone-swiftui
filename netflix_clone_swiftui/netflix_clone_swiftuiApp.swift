//
//  netflix_clone_swiftuiApp.swift
//  netflix_clone_swiftui
//
//  Created by Dilshan Harendra Perera on 2022-07-29.
//

import SwiftUI

@main
struct netflix_clone_swiftuiApp: App {
    
    var movieData = MovieData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(movieData)
        }
    }
}
