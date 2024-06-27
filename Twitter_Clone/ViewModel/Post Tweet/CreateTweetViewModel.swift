//
//  CreateTweetViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 25/06/2024.
//

import SwiftUI

class CreateTweetViewModel: ObservableObject {
    
    func uploadPost(text: String, image: UIImage?) {
            
        guard let user =  AuthViewModel.shared.currentUser else { return }
        
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.postTweet(text: text, user: user.name, username: user.username, userId: user.id) { result in
            if let image = image {
                if let id = result?["_id"]! {
                    ImageUploader.uploadImage(paramName: "upload", fileName: "png",image: image, urlPath: "uploadTweetImage/\(id)")
                }
            }
        }
    }
}

