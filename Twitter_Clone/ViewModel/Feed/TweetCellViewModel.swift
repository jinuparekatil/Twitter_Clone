//
//  TweetCellViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 27/06/2024.
//

import SwiftUI

class TweetCellViewModel: ObservableObject {
    
    @Published var tweet: Tweet
    @Published var user: User?
    let currentUser: User
    
    init(tweet: Tweet, currentUser: User) {
        self.tweet = tweet
        self.currentUser = currentUser
        self.fetchUser(userId: self.tweet.userId)
        self.checkIfUserLikedPost()
    }
    
    func fetchUser(userId: String) {
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        AuthServices.fetchUser() { result in
            switch result {
            case .success(let data):
                do {
                    let user  = try? JSONDecoder().decode(User.self, from: data as Data )
                    DispatchQueue.main.async {
                        self.user = user
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func like() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.tweet.id)/like"
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("tweet has been liked")
        }
        
        RequestServices.requestDomain = "http://localhost:3000/notifications"
        RequestServices.sendNotification(userName: self.currentUser.username, notSenderId: self.currentUser.id, notRecieverId: self.tweet.id, notificationType: NotificationType.like.rawValue, postText: self.tweet.text) { result in
            print(result)
        }
        self.tweet.didLike = true
    }
    
    func unlike() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.tweet.id)/unlike"
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("tweet has been unliked")
        }
        self.tweet.didLike = false
    }
    
    func checkIfUserLikedPost() {
        if (self.tweet.Likes.contains(self.currentUser.id)) {
            self.tweet.didLike = true
        }
        else {
            self.tweet.didLike = false
        }
    }
}
