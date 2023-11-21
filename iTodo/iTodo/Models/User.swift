//
//  User.swift
//  ITodo
//
//  Created by Kuba Rejmann on 27/09/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    
    let joinedAt: TimeInterval
}
