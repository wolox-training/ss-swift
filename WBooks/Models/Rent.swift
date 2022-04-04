//
//  Rent.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/03/2022.
//

import Foundation
public struct Rent: Codable {
    let userID: Int
    let bookID: Int
    let fromDate: String
    let toDate: String
}
