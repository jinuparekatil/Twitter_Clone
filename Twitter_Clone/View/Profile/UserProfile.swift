//
//  UserProfile.swift
//  Twitter_Clone
//
//  Created by Jinu on 16/06/2024.
//

import SwiftUI

struct UserProfile: View {
    @State var offset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    @State var currentTab = "Tweets"
    @State var tabBarOffset : CGFloat = 0
    @Namespace var animation
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(spacing: 15, content: {
                GeometryReader { proxy -> AnyView in
                    
                    let minY = proxy.frame(in: .global).minY
                   
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return AnyView(
                        ZStack {
                            Image("banner")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width, height: minY > 0 ? 180 + minY : 180,alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                            
                            BlurView()
                                .opacity(blurViewOpacity())
                            VStack(spacing: 5, content: {
                                Text("Jinu")
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                Text("150 tweets")
                                    .foregroundStyle(.white)
                            })
                            .offset(y:120)
                            .offset(y: titleOffset > 100 ? 0 : -getTitleOffset())
                            .opacity(titleOffset < 100 ?1 : 0)
                        }
                            .clipped()
                            .frame(height: minY > 0 ?  180 + minY : nil)
                            .offset(y: minY > 0 ? -minY :  -minY < 80 ? 0 : -minY - 80)
                    )
                }
                .frame(height: 180)
                .zIndex(1)
                
                VStack{
                    HStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75,height: 75)
                            .clipShape(Circle())
                            .padding(8)
                            .background(Color.white)
                            .clipShape(Circle())
                            .offset(y: offset < 0 ? getOffset()-20 : -20)
                            .scaleEffect(getScale())
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Edit Profile")
                                .foregroundStyle(.blue)
                                .padding(.vertical,10)
                                .padding(.horizontal)
                                .background(
                                 Capsule()
                                    .stroke(Color.blue,lineWidth: 1.5))
                        })
                    }
                    .padding(.top, -25)
                    .padding(.bottom, -10)
                    VStack(alignment: .leading,spacing: 8, content: {
                        Text("Jinu")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                        Text("@jnujoy")
                            .foregroundStyle(.gray)
                        
                        Text("I don't know what I don't know . So, I try to figure out what I don't know. ")
                        
                        HStack(spacing: 5, content: {
                            Text("13")
                                .foregroundStyle(.primary)
                                .fontWeight(.semibold)
                            Text("Followers")
                                .foregroundStyle(.gray)
                            Text("680")
                                .foregroundStyle(.primary)
                                .fontWeight(.semibold)
                                .padding(.leading,20)
                            Text("Following")
                                .foregroundStyle(.gray)

                        })
                    })
                    .overlay(
                        GeometryReader { proxy -> Color in
                            
                            let minY = proxy.frame(in: .global).minY
                            DispatchQueue.main.async {
                                
                                self.titleOffset = minY
                            }
                            return Color.clear
                        }
                            .frame(width: 0,height: 0),alignment: .top )
                    VStack(spacing: 0, content: {
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing: 0, content: {
                                TabButtons(title: "Tweets", currentTab: $currentTab, animation: animation)
                                TabButtons(title: "Tweets & Likes", currentTab: $currentTab, animation: animation)
                                TabButtons(title: "Media", currentTab: $currentTab, animation: animation)
                                TabButtons(title: "Likes", currentTab: $currentTab, animation: animation)
                            })
                        }
                        Divider()
                    })
                    .padding(.top,30)
                    .background(Color.white)
                    .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
                    .overlay(
                        GeometryReader {  proxy -> Color in
                            let minY = proxy.frame(in: .global).minY
                            DispatchQueue.main.async{
                                self.tabBarOffset = minY
                            }
                            return Color.clear
                        }
                            .frame(width: 0,height: 0),alignment: .top
                    )
                    .zIndex(1.0)
                    
                    VStack(spacing: 18, content: {
                        TweetCellView(tweet: "Hey Tim, are those regular glasses?", tweetImage: "post")
                        Divider()
                        
                        ForEach(0..<20, id: \.self) {_ in
                            TweetCellView(tweet: sampleText)
                            Divider()
                        }
                    })
                    .padding(.top)
                    .zIndex(0)

                }
                .padding(.horizontal)
                .zIndex(-offset > 80 ? 0 : 1)
            })
        }
        .ignoresSafeArea(.all,edges: .top)
    }
    
    func blurViewOpacity() -> Double {
        let progress = -(offset + 80) / 150
        
        return Double(-offset > 80 ? progress : 0)
    }
    func getTitleOffset() -> CGFloat {
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    func getOffset() -> CGFloat {
        let progress = (-offset / 80) * 20
        return progress <= 20 ? progress : 20
    }
    func getScale() -> CGFloat {
        let progress = -offset / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
}
    

#Preview {
    UserProfile()
}
