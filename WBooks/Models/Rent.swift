//
//  Rent.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 28/03/2022.
//

import Foundation
public struct Rent: Codable {
    let userID, bookID: Int
    let fromDate, toDate: String
}
