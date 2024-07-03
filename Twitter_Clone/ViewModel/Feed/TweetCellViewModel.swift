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
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.fetchUser(userId: self.tweet.userId)
    }
    
    func fetchUser(userId: String) {
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        AuthServices.fetchUser(id: userId) { result in
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
    }
    
    func unlike() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.tweet.id)/unlike"
        RequestServices.likeTweet(id: self.tweet.id) { result in
            print("tweet has been liked")
        }
    }
}
