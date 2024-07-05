//
//  Notification.swift
//  Twitter_Clone
//
//  Created by Jinu on 05/07/2024.
//

import Foundation


struct Notification : Decodable, Identifiable {
    var _id: String
    var id: String {
        return _id
    }
    var userName: String
    var notSenderId: String
    var notRecieverId: String
    var postText: String?
    var notificationType: NotificationType
}

enum NotificationType: String, Decodable {
    
    case like = "like"
    case follow = "follow"
    
    var notificationMessage: String {
        switch self {
        case .like:
            return("liked your tweet.")
        case .follow:
            return("followed you")
        }
    }
}
