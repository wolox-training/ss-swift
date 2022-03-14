//
//  Book.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 14/03/2022.
//

import UIKit

class Book {
    // MARK: -Properties
    let author: String
    let title: String
    let imageUrl: URL?
    
    init(author: String, title: String, imageUrl: URL?){
        self.author = author
        self.title = title
        self.imageUrl = imageUrl
    }
}
