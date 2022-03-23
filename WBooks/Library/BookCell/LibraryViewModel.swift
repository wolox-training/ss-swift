//
//  BookCellViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 14/03/2022.
//

import Foundation

class LibraryViewModel {
    private(set) var books: [Book] = []
    private var repository = BookRepository()
    
    func getBooks(action: @escaping () -> Void) {
        let onSuccess = { (books: [Book]) in
            self.books = books
            self.books.removeAll(where: { book in
                let title = book.title
                return title.count < 10 ||
                title.lowercased().contains("prueba") ||
                title.lowercased().contains("asd") ||
                title.lowercased().contains("ksd")
            })
            action()
        }
        let onError = { error in print(error) }
        repository.fetchBooks(onSuccess: onSuccess, onError: onError)
    }
}
