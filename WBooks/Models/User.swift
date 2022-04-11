//
//  User.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 30/03/2022.
//

import Foundation

public struct User: Codable {
    let id: Int
    let username, password, image: String
}
