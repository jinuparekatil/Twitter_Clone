//
//  ProfileViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 30/06/2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var tweet = [Tweet]()
    init(user: User) {
        self.user = user
        fetchTweets()
        checkIfUserIsCurrentUser()
    }
    
    
    func fetchTweets() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.user.id)"
        
        RequestServices.fetchTweets { result in
            switch result {
            case .success(let data):
                guard let tweet  = try? JSONDecoder().decode([Tweet].self, from: (data as! Data)) else { return }
                DispatchQueue.main.async {
                    self.tweet = tweet
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    func checkIfUserIsCurrentUser() {
        if(self.user.id == AuthViewModel.shared.currentUser?._id) {
            self.user.isCurrentUser = true
        }
    }
    
    func follow() {
        RequestServices.requestDomain = "http://localhost:3000/users/\(self.user.id)/follow"
        
        RequestServices.folowingProcess(id: self.user.id) { result in
            print(result)
            print("Followed")
        }
    }
    
    func unfollow() {
        RequestServices.requestDomain = "http://localhost:3000/users/\(self.user.id)/unfollow"
        
        RequestServices.folowingProcess(id: self.user.id) { result in
            print(result)
            print("Followed")
        }
    }
    
}
