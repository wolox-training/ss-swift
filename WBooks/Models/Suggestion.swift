//
//  Suggestion.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/04/2022.
//

import Foundation

public struct Suggestion: Codable {
    let id: Int
    let userID: Int
    let title, author, link: String
    
    private enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case id
        case title
        case author
        case link
    }
}
