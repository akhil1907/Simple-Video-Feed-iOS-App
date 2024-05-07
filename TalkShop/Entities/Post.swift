//
//  Post.swift
//  TalkShop
//
//  Created by Akhil Jain on 04/05/24.
//

import Foundation

struct Post: Codable{
    
    var post_id : Int
    var video_url: String
    var thumbnail_url: String
    var username: String
    var like_count: Int
    
}
