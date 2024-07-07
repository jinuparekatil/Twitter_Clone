//
//  FeedViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 27/06/2024.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var  tweets = [Tweet]()
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        RequestServices.fetchData { result in
            switch result {
            case .success(let data):
                
                guard let tweets = try? JSONDecoder().decode([Tweet].self, from: data as! Data) else { return }
                DispatchQueue.main.async {
                    self.tweets = tweets
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
