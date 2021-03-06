//
//  Comment.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 29/03/2022.
//

import Foundation

public struct Comment: Decodable {
    let id, userID, bookID: Int
    let content: String
    
    private enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case bookID = "book_id"
        case id
        case content
    }
}
