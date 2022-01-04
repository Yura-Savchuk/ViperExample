//
//  APIUser.swift
//  ViperExample
//
//  Created by Yurii Savchuk on 30.12.2021.
//

import UIKit

struct APIUser: Decodable {
    let userName: String
    let passwordHash: String
    let token: String
    
    enum CodingKeys: String, CodingKey {
        case username
        case password_hash
        case token
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userName = try container.decode(String.self, forKey: .username)
        passwordHash = try container.decode(String.self, forKey: .password_hash)
        token = try container.decode(String.self, forKey: .token)
    }
    
}
