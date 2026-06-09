//
//  HomeView.swift
//  Favorites
//
//  Created by Levi Daniel on 6/6/26.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView {
            List {
                // Cities Section
                let favoriteCities = viewModel.cities.filter { $0.isFavorite }
                if !favoriteCities.isEmpty {
                    Section(header: Text("Cities")) {
                        ForEach(favoriteCities) { city in
                            FavoriteRowView(title: city.cityName, icon: "building.2") {
                                viewModel.toggleFavoriteCity(city: city)
                            }
                        }
                    }
                }
                
                // Hobbies Section
                let favoriteHobbies = viewModel.hobbies.filter { $0.isFavorite }
                if !favoriteHobbies.isEmpty {
                    Section(header: Text("Hobbies")) {
                        ForEach(favoriteHobbies) { hobby in
                            FavoriteRowView(title: hobby.hobbyName, icon: "star") {
                                viewModel.toggleFavoriteHobby(hobby: hobby)
                            }
                        }
                    }
                }
                
                // Books Section
                let favoriteBooks = viewModel.books.filter { $0.isFavorite }
                if !favoriteBooks.isEmpty {
                    Section(header: Text("Books")) {
                        ForEach(favoriteBooks) { book in
                            FavoriteRowView(title: book.bookTitle, icon: "book") {
                                viewModel.toggleFavoriteBook(book: book)
                            }
                        }
                    }
                }
                
                if favoriteCities.isEmpty && favoriteHobbies.isEmpty && favoriteBooks.isEmpty {
                    Text("No favorites yet!")
                        .foregroundColor(.secondary)
                        .italic()
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

// Reusable row to keep the UI consistent and code clean
struct FavoriteRowView: View {
    let title: String
    let icon: String
    let onRemove: () -> Void
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
            Text(title)
            Spacer()
            Button(action: onRemove) {
                Image(systemName: "heart.slash.fill")
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}
