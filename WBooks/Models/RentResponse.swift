//
//  RentResponse.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/03/2022.
//

import Foundation

public struct RentResponse: Decodable {
     let from: String
     let id: Int
     let toDate: String
     let bookID: Int
     let userID: Int
    
    private enum CodingKeys: String, CodingKey {
        case toDate = "to"
        case bookID
        case userID
        case id
        case from
    }
}
