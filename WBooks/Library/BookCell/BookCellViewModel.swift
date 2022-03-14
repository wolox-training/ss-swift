//
//  BookCellViewModel.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 14/03/2022.
//

import UIKit

class BookCellViewModel {
    private let _book: Book
    
    init(book: Book){
        _book = book
    }
    
    var title: String {
        return _book.title
    }
    
    var author: String {
        return _book.author
    }
}
