//
//  Tweet.swift
//  twitter-clone (iOS)
//
//  Created by Jinu on 25/06/2024.
//

import SwiftUI

struct Tweet: Identifiable, Decodable {
    let _id: String
    
    var id: String {
        return _id
    }
    
    let text: String
    let userId: String
    let userName: String
    let user: String
    let image: String?
}
