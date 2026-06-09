//
// FavoritesApp.swift : Favorites
//
// Copyright © 2025 Auburn University.
// All Rights Reserved.


import SwiftUI

@main
struct FavoritesApp: App {
    
    // Contains the instance of data.
    @StateObject private var favoritesViewModel = FavoritesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(favoritesViewModel)
        }
    }
}
