//
//  NewBook.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 18/04/2022.
//

import Foundation

public struct BookRequest: Codable {
    let author, title, genre, year, image, status: String
    init(author: String, title: String, image: String, genre: String, year: String, status: String) {
        self.author = author
        self.title = title
        self.image = image
        self.genre = genre
        self.year = year
        self.status = status
    }
}
