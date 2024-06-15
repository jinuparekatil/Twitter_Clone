//
//  FeedView.swift
//  Twitter_Clone
//
//  Created by Jinu on 13/06/2024.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(spacing: 18, content: {
                TweetCellView(tweet: "Hey Tim, Are those regular glasses?",tweetImage: "post")
               

                ForEach(1...20,id: \.self) { _ in
                    TweetCellView(tweet: sampleText)
                }
            })
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }
    }
}

#Preview {
    FeedView()
}
