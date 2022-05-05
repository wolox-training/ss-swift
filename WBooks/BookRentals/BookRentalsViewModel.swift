//
//  BookRentalsViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 25/04/2022.
//

import Foundation

protocol BookRentalsViewProtocol {
    func bookRentalsCardViewModel() -> BookRentalsCardViewModel
    func bookSuggestionsCardViewModel() -> BookSuggestionsCardViewModel
}

final class BookRentalsViewModel: BookRentalsViewProtocol {
    func bookRentalsCardViewModel() -> BookRentalsCardViewModel {
        return BookRentalsCardViewModel()
    }
    
    func bookSuggestionsCardViewModel() -> BookSuggestionsCardViewModel {
        return BookSuggestionsCardViewModel()
    }
}
