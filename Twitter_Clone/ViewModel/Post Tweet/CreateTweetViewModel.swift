//
//  CreateTweetViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 25/06/2024.
//

import SwiftUI

class CreateTweetViewModel: ObservableObject {
    
    func uploadPost(text: String) {
            
        guard let user =  AuthViewModel.shared.currentUser else { return }
        
        RequestServices.reqestDomain = "http://localhost:3000/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
            print(result)
        }
    }
}

