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
    let imageUrl: URL?
    init(author: String, title: String, imageUrl: URL?) {
        self.author = author
        self.title = title
        self.imageUrl = imageUrl
    }
    
    public init(from: Decoder){
        let container = try! from.container(keyedBy: BookKey.self)
        id = try! container.decode(Int.self, forKey: .id)
        title = try! container.decode(String.self, forKey: .title)
        author = try! container.decode(String.self, forKey: .author)
        genre = try! container.decode(String.self, forKey: .genre)
        year = try! container.decode(String.self, forKey: .year)
        imageUrl = try! container.decode(String.self, forKey: .image)
    }
}
