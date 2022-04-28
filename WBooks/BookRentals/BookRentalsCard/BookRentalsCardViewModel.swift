//
//  BookRentalsCardViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 26/04/2022.
//

import Foundation

protocol BookRentalsCardViewProtocol {
    var rents: [RentResponse] { get set }
    var books: [Book] { get set }
    func getRents(action: @escaping () -> Void)
}

final class BookRentalsCardViewModel: BookRentalsCardViewProtocol {
    internal var rents: [RentResponse] = []
    internal var books: [Book] = []
    private var repository = RentRepository()
    private var bookRepository = BookRepository()
    
    func getRents(action: @escaping () -> Void) {
        let userID = 1
        let onSuccess = { (rents: [RentResponse]) in
            rents.forEach { rent in
                self.getBook(bookID: rent.bookID) { book in
                    self.books.append(book)
                    if rents.count == self.books.count {
                        action()
                    }
                }
            }
        }
        let onError = { error in print(error) }
        repository.fetchRentals(onSuccess: onSuccess, onError: onError, userID: userID)
    }
    
    private func getBook(bookID: Int, action: @escaping (Book) -> Void) {
        let onSuccess = { (book: Book) in
            action(book)
        }
        let onError = { error in print(error) }
        bookRepository.getBook(onSuccess: onSuccess, onError: onError, bookId: bookID)
    }
}
