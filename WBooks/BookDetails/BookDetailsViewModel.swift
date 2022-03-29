//
//  BookDetailsViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/03/2022.
//

import Foundation

class BookDetailsViewModel {
    let book: Book
    private var rentRepository = RentRepository()
    private(set) var comments: [Comment] = []
    private var commentRepository = CommentRepository()
    
    init(book: Book) {
        self.book = book
    }
    
    func rentBook(action: @escaping () -> Void) {
        let onSuccess = { (_: RentResponse) in
            action()
        }
        let onError = { error in print(error) }
        rentRepository.rentBook( onSuccess: onSuccess,
                                 onError: onError,
                                 parameters: getParametersRent() )
    }
    
    func getParametersRent() -> Rent {
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let theCalendar = Calendar.current
        let nextDate = theCalendar.date(byAdding: .day, value: 1, to: today)
        let parameters = Rent(userID: 10,
                              bookID: book.id,
                              fromDate: formatter.string(from: today),
                              toDate: formatter.string(from: nextDate!)
        )
        return parameters
    }
    
    func getComments(action: @escaping () -> Void) {
        let onSuccess = { (comments: [Comment]) in
            self.comments = comments
            action()
        }
        let onError = { error in print(error) }
        commentRepository.fetchComments(onSuccess: onSuccess, onError: onError, bookID: book.id)
    }
}
