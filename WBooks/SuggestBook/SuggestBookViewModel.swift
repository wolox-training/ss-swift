//
//  SuggestBookViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 12/04/2022.
//

import Foundation

protocol SuggestBookViewProtocol {
    func suggestBook(bookRequest: Book, action: @escaping (Error?) -> Void)
    func getParametersBook(author: String, title: String, genre: String, year: String) -> Book
}

public class SuggestBookViewModel: SuggestBookViewProtocol {
    private var bookRepository = BookRepository()
    
    func suggestBook(bookRequest: Book, action: @escaping (Error?) -> Void) {
        let onSuccess = { (_: Book) in
            action(nil)
        }
        let onError = { error in action(error) }
        bookRepository.addBook( onSuccess: onSuccess,
                                 onError: onError,
                                 parameters: bookRequest)
    }
    
    func getParametersBook(author: String, title: String, genre: String, year: String) -> Book {
        let url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-vbS7UDpiXAE4Ity4-l8YWZkVVrlvyN7HGg&usqp=CAU"
        let status = "Available"
        let bookRequest = Book(author: author,
                           title: title,
                           image: url,
                           genre: genre,
                           year: year,
                           id: nil,
                           status: status
        )
        return bookRequest
    }
}
