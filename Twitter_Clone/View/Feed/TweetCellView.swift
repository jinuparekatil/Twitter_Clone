//
//  TweetCellView.swift
//  Twitter_Clone
//
//  Created by Jinu on 14/06/2024.
//

import SwiftUI

struct TweetCellView: View {
    var tweet: String
    var tweetImage: String?
    var body: some View {
        VStack {
            HStack(alignment: .top
                   ,spacing: 10, content: {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 55,height: 55)
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 10, content: { 
                    (
                    Text("Jinu ")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    +
                    Text("@jinu_joy")
                        .foregroundStyle(.gray)
                    )
                    
                    Text(tweet)
                        .frame(maxHeight: 100,alignment: .top)
                    if let image = tweetImage {
                        GeometryReader { proxy in
                            Image(image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width,height: 250)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .frame(height: 250)
                    }
                })
            })
            //Cell Bottom
            HStack(spacing: 50, content: {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("Comments")
                        .resizable()
                        .frame(width: 16,height: 16)
                })
                .foregroundStyle(.gray)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("Retweet")
                        .resizable()
                        .frame(width: 18,height: 14)
                })
                .foregroundStyle(.gray)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("love")
                        .resizable()
                        .frame(width: 18,height: 15)
                })
                .foregroundStyle(.gray)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("upload")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 18,height: 15)
                })
                .foregroundStyle(.gray)
            })
            .padding(.top,4)
        }
    }
}

#Preview {
    TweetCellView(tweet: sampleText)
}

var sampleText = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
