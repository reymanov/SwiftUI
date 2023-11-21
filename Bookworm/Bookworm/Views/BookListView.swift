//
//  ContentView.swift
//  Bookworm
//
//  Created by Kuba Rejmann on 16/11/2023.
//

import SwiftUI

struct BookListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.genre, ascending: true),
        NSSortDescriptor(keyPath: \Book.title, ascending: true)
    ],
                  animation: .default
    ) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            VStack{
                if books.isEmpty {
                    ContentUnavailableView {
                        Label("Books", systemImage: "book")
                    } description: {
                        Text("You have no books yet")
                    } actions: {
                        Button("Add a book") {
                            showingAddScreen.toggle()
                        }
                    }
                    .padding(.bottom, 60)
                    
                } else {
                    List {
                        let groupedBooks = Dictionary(grouping: books) { $0.genre ?? "Unknown Genre" }
                            .sorted { $0.key < $1.key }
                        
                        ForEach(groupedBooks, id: \.0) { genre, books in
                            Section(header: Text(genre)) {
                                ForEach(books, id: \.id) { book in
                                    NavigationLink {
                                        BookDetailView(book: book)
                                    } label: {
                                        
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text(book.title ?? "Unknown Title")
                                                    .font(.headline)
                                                
                                                Text(book.author ?? "Unknown Author")
                                                    .foregroundColor(.secondary)
                                            }
                                            Spacer()
                                            
                                            EmojiRatingView(rating: book.rating)
                                                .font(.subheadline)
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete(perform: deleteBooks)
                    }
                }
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddScreen.toggle()
                    } label: {
                        Label("Add Book", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                AddBookView()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

#Preview {
    BookListView()
}
