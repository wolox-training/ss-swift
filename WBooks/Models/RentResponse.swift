//
//  RentResponse.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/03/2022.
//

import Foundation

public struct RentResponse: Decodable {
     let from, toDate: String?
     let id, bookID, userID: Int
    
    private enum CodingKeys: String, CodingKey {
        case toDate = "to"
        case bookID = "book_id"
        case userID = "user_id"
        case id
        case from
    }
}
