//
//  RentResponse.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/03/2022.
//

import Foundation

public struct RentResponse: Codable {
     let from: String
     let id: Int
     let to: String
     let bookID: Int
     let userID: Int
}
