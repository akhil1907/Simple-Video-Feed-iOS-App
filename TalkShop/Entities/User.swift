//
//  User.swift
//  TalkShop
//
//  Created by Akhil Jain on 06/05/24.
//

import Foundation

struct User: Codable {
    
    var username: String
    var profileImageUrl: String
    var posts: [Post]
    
}
