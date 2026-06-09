//
//  HomeView.swift
//  Favorites
//
//  Created by Levi Daniel on 6/6/26.
//

import SwiftUI

enum ContentCategory : String, CaseIterable { // Cases are String types, cases can be looped through.
    
    case cities = "Citites"
    case hobbies = "Hobbies"
    case books = "Books"
    
}

struct HomeView: View {
    
    @State private var selectedCategory : ContentCategory = .cities
    @State private var searchText : String = ""
    @EnvironmentObject private var favorites : FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Categories", selection: $selectedCategory) {
                    ForEach(ContentCategory.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                selectedContentView()
            }
            .navigationTitle("Browse")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText, prompt: "Search \(selectedCategory.rawValue)")
        }
        
    }
    
    @ViewBuilder
    private func selectedContentView() -> some View {
        if selectedCategory == .cities {
            CitiesView(searchText: $searchText)
        } else if selectedCategory == .hobbies {
            HobbiesView(searchText: $searchText)
        } else if selectedCategory == .books {
            BooksView(searchText: $searchText)
        } else {
            
        }
    }
    
    
}

#Preview {
    HomeView()
        .environmentObject(FavoritesViewModel())
}
