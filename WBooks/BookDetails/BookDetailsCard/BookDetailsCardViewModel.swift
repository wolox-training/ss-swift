//
//  BookDetailsCardViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 31/03/2022.
//

import Foundation

class BookDetailsCardViewModel {
    let book: Book
    private var rentRepository = RentRepository()
    
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
}
