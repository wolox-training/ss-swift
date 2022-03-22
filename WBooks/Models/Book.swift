//
//  Book.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 14/03/2022.
//

import UIKit

public struct Book: Codable {
    let id: Int
    let author: String
    let title: String
    let genre: String
    let year: String
    let image: String
    init(author: String, title: String, image: String, genre: String, year: String, id: Int) {
        self.author = author
        self.title = title
        self.image = image
        self.genre = genre
        self.year = year
        self.id = id
    }
}
