//
//  APIModel.swift
//  FirstApp
//
//  Created by Vinay on 15/12/23.
//

import Foundation
struct WelcomeElement: Codable {
    let postID, id: Int
    let name, email, body: String

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
