//
//  TweetCellView.swift
//  Twitter_Clone
//
//  Created by Jinu on 14/06/2024.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
//    var tweet: String
//    var tweetImage: String?

    @ObservedObject var viewModel: TweetCellViewModel
    
    var didLike: Bool{ return viewModel.tweet.didLike ?? false }
    
    init(viewModel: TweetCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top
                   ,spacing: 10, content: {
                if let user = self.viewModel.user {
                    NavigationLink {
                        UserProfile(user: user)
                    } label: {
                        KFImage(URL(string: "http://localhost:3000/user/\(self.viewModel.tweet.userId)/avatar"))
                            .placeholder{
                                Image("blankpp")
                                    .resizable()
                            }
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55,height: 55)
                            .clipShape(Circle())
                    }
                }

                VStack(alignment: .leading,spacing: 10, content: {
                    (
                        Text(self.viewModel.tweet.user)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    +
                    Text("@\(self.viewModel.tweet.userName)")
                        .foregroundStyle(.gray)
                    )
                    
                    Text(self.viewModel.tweet.text)
                        .frame(maxHeight: 100,alignment: .top)
                  
                     let imageId = viewModel.tweet.id
                        if viewModel.tweet.image == "true" {
                            GeometryReader{ proxy in
                                KFImage(URL(string: "http://localhost:3000/tweets/\(imageId)/image"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.frame(in: .global).width,height: 250)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            .frame(height: 250)
                        }
                    
                    
                })
                Spacer()
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
                Button(action: {
                    if self.didLike {
                        self.viewModel.unlike()
                    }
                    else {
                        self.viewModel.like()
                    }
                }, label: {
                    if (self.didLike == false) {
                        Image("love")
                            .resizable()
                            .frame(width: 18,height: 15)
                    }
                    else {
                        Image("love")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.red)
                            .frame(width: 18,height: 15)
                    }
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

//#Preview {
//    TweetCellView(viewModel: sampleText)
//}

var sampleText = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
