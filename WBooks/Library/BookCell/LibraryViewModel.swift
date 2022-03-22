//
//  BookCellViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 14/03/2022.
//

import UIKit

class LibraryViewModel {
    private var _book: [Book] = []
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
        let book = Book(author: authors[index], title: titles[index], imageUrl: nil)
        return book
    }
    
    func getBooks() {
        let onSuccess = { books in print(books) }
        let onError = {error in print(error) }
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
}
