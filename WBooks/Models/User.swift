//
//  User.swift
//  WBooks
//
//  Created by sebastian.a.spadea on 30/03/2022.
//

import Foundation

public struct User: Codable {
    let id: Int
    let username: String
    let password: String
    let image: String
}
