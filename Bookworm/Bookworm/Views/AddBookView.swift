//
//  AddBookView.swift
//  Bookworm
//
//  Created by Kuba Rejmann on 16/11/2023.
//

import SwiftUI

let genres = [
    "Fiction",
    "Mystery",
    "Thriller",
    "Science Fiction",
    "Fantasy",
    "Romance",
    "Historical Fiction",
    "Biography",
    "Self-Help",
    "Science",
    "Travel",
    "Cooking",
    "Children's",
    "Young Adult",
    "Horror",
    "Crime",
    "Dystopian",
    "Adventure",
    "Non-Fiction",
    "Poetry"
]

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = genres[0]
    @State private var review = ""
    @State private var rating = 0
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                        .frame(minHeight: 100)
                    HStack{
                        Spacer()
                        RatingView(rating: $rating)
                        Spacer()
                    }
                } header: {
                    Text("Write a review")
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button("Add a book") {
                                let newBook = Book(context: moc)
                                newBook.id = UUID()
                                newBook.title = title
                                newBook.author = author
                                newBook.genre = genre
                                newBook.review = review
                                newBook.rating = Int16(rating)
                            
                            
                            try? moc.save()
                            dismiss()
                        }
                        .disabled(title.isEmpty || author.isEmpty)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Add a book")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
            }
            
        }
    }
}

#Preview {
    AddBookView()
}
