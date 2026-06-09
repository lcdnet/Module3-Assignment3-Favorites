//
//  BookView.swift
//  Favorites
//
//  Created by Levi Daniel on 6/7/26.
//

import SwiftUI

struct BooksView: View {
    @EnvironmentObject var favorites : FavoritesViewModel
    @Binding var searchText : String
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(favorites.filteredBooks(searchText: searchText)) { book in
                    BookRowView(book: book)
                    Divider()
                }
            }
            .padding()
        }
    }
}

#Preview {
    BooksView(searchText: .constant(""))
        .environmentObject(FavoritesViewModel())
}
