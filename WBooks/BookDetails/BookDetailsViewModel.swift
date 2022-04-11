//
//  BookDetailsViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/03/2022.
//

import Foundation

protocol BookDetailsViewModelProtocol {
    func bookDetailsCardViewModel() -> BookDetailsCardViewModel
    func bookCommentsCardViewModel() -> BookCommentsCardViewModel
    var book: Book { get set }
}

class BookDetailsViewModel: BookDetailsViewModelProtocol {
    var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    func bookDetailsCardViewModel() -> BookDetailsCardViewModel {
        return BookDetailsCardViewModel(book: book)
    }
    
    func bookCommentsCardViewModel() -> BookCommentsCardViewModel {
        return BookCommentsCardViewModel(book: book)
    }
}
