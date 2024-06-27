//
//  FeedView.swift
//  Twitter_Clone
//
//  Created by Jinu on 13/06/2024.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel = FeedViewModel()
    let user: User
    
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            LazyVStack(spacing: 18, content: {
                ForEach(viewModel.tweets) { tweet in
                    
                    TweetCellView(tweet: tweet.text)
                    
                    Divider()
                }
            })
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }
    }
}

//#Preview {
//    FeedView()
//}
