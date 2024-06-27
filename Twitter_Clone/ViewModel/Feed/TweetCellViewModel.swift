//
//  TweetCellViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 27/06/2024.
//

import SwiftUI

class TweetCellViewModel: ObservableObject {
    
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
}
