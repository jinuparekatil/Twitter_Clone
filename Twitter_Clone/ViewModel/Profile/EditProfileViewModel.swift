//
//  EditProfileViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 30/06/2024.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    @Published var uploadComplete = false
    
    init(user: User) {
        self.user = user
    }
    
    func save(name: String?,bio: String?, website: String?, location: String?) {
        
        guard let name = name else { return }
        guard let bio = bio else { return }
        guard let website = website else { return }
        guard let location = location else { return }
        
        self.user.name = name
        self.user.bio = bio
        self.user.website = website
        self.user.location = location
        
    }
    
    func uploadProfileImage(text: String, image: UIImage?) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        let urlPath = "users/me/avatar"
        if let image = image {
            ImageUploader.uploadImage(paramName: "avatar", fileName: "avatar.png", image: image, urlPath: urlPath)
            
        }
            
        
    }
    
    func uploadUserData(name: String, bio: String, website: String, location: String ) {
        let userId = user.id
        let urlPath = "users/\(userId)"
//        let url = URL(string: "http://localhost:3000/\(urlPath)")!
        
        guard let url = URL(string: "http://localhost:3000/\(urlPath)") else {
            print("Invalid URL")
            return
        }
        AuthServices.makePatchRequestWithAuth(urString: url, reqBody: ["name":name , "bio":bio, "website":website, "location": location ]) { result in
            DispatchQueue.main.async {
                self.save(name: name, bio: bio, website: website, location: location)
                self.uploadComplete = true
            }
        }
    }
}
