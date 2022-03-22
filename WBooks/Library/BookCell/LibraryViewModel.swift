//
//  BookCellViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 14/03/2022.
//

import Foundation

class LibraryViewModel {
    var books: [Book] = []
    private var repository = BookRepository()

    private var titles = ["A Little Bird Told Me",
                  "When the Doves Disappeared",
                  "The Best Book in the World",
                  "Be Creative",
                  "This is also UX",
                  "A Little Bird Told Me",
                  "When the Doves Disappeared",
                  "The Best Book in the World",
                  "Be Creative",
                  "This is also UX"]
    private var authors = ["Timothy Cross",
                   "Sofi Oksanen",
                   "Peter Sjernstrom",
                   "Tony Alcazar",
                   "Liliana Castilla",
                   "Timothy Cross",
                   "Sofi Oksanen",
                   "Peter Sjernstrom",
                   "Tony Alcazar",
                   "Liliana Castilla"]

    func getBooksByIndex(index: Int) -> Book {
        let book = Book(author: authors[index], title: titles[index], image: "", genre: "", year: "", id: 0)
        return book
    }
    
    func getBooks(action: @escaping () -> ()) {
        let onSuccess = { (books: [Book]) in
            self.books = books
            action()
        }
        let onError = { error in print(error) }
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
}
