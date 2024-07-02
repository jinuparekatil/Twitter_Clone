//
//  UserProfile.swift
//  Twitter_Clone
//
//  Created by Jinu on 16/06/2024.
//

import SwiftUI
import Kingfisher


struct UserProfile: View {
    let user : User
    @ObservedObject var viewModel : ProfileViewModel
    
    var isCurrentUser: Bool {
        return viewModel.user.isCurrentUser ?? false
    }
    
    @State var editProfileShow = false
    
    @State var offset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    @State var currentTab = "Tweets"
    @State var tabBarOffset : CGFloat = 0
    
    @Namespace var animation
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
        print("User: \(self.viewModel.user.isCurrentUser)")
        
    }
    
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
                                Text(user.name)
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
                        KFImage(URL(string: "http://localhost:3000/user/\(self.viewModel.user.id)/avatar"))
                            .placeholder {
                                Image("blankpp")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75,height: 75)
                                    .clipShape(Circle())
                            }
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
                        if(isCurrentUser) {
                            Button(action: {
                                editProfileShow.toggle()
                            }, label: {
                                Text("Edit Profile")
                                    .foregroundStyle(.blue)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(
                                     Capsule()
                                        .stroke(Color.blue,lineWidth: 1.5))
                            })
                            .sheet(isPresented: $editProfileShow){
                                
                            } content: {
                                EditProfileView(user: $viewModel.user)
                            }

                        }
                        else {
                            Button(action: {
                                //Add the function to follow and unfollow
                                self.viewModel.follow()
                            }, label: {
                                Text("Follow")
                                    .foregroundStyle(.white)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(
                                        ZStack {
                                            Capsule()
                                                .foregroundStyle(.black)
                                        }
                                    )
                            })
                        }
                    }
                    .padding(.top, -25)
                    .padding(.bottom, -10)
                    
                    // Profile Data
                    HStack {
                        VStack(alignment: .leading,spacing: 8, content: {
                            Text(self.viewModel.user.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.primary)
                            Text("@\(self.viewModel.user.username)")
                                .foregroundStyle(.gray)
                            
                            Text(self.viewModel.user.bio ?? "I don't know what I don't know . So, I try to figure out what I don't know. ")
                            
                            HStack(spacing: 8) {
                                if let userLocation = self.viewModel.user.location {
                                    if userLocation != "" {
                                        HStack(spacing: 2) {
                                            Image(systemName: "mappin.circle.fill")
                                                .frame(width: 24,height: 24)
                                                .foregroundStyle(.gray)
                                            Text(userLocation)
                                                .foregroundStyle(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                                
                                if let userwebsite = self.viewModel.user.website {
                                    if userwebsite != "" {
                                        HStack(spacing: 2) {
                                            Image(systemName: "link")
                                                .frame(width: 24,height: 24)
                                                .foregroundStyle(.gray)
                                            Text(userwebsite)
                                                .foregroundStyle(Color("twitter"))
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                            }
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
                            .padding(.top,8)
                        })
                        .padding(.leading,8)
                        .overlay(
                            GeometryReader { proxy -> Color in
                                
                                let minY = proxy.frame(in: .global).minY
                                DispatchQueue.main.async {
                                    
                                    self.titleOffset = minY
                                }
                                return Color.clear
                            }
                                .frame(width: 0,height: 0),alignment: .top )
                        Spacer()
                    }
                    // Custom segmented menu ..
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
                    VStack(spacing: 18 ) {
                        ForEach(viewModel.tweet) { tweet in
                            TweetCellView(viewModel: TweetCellViewModel(tweet: tweet))
                        }
                    }
//                    VStack(spacing: 18, content: {
//                        TweetCellView(tweet: "Hey Tim, are those regular glasses?", tweetImage: "post")
//                        Divider()
//                        
//                        ForEach(0..<20, id: \.self) {_ in
//                            TweetCellView(tweet: sampleText)
//                            Divider()
//                        }
//                    })
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
    

//#Preview {
//    UserProfile()
//}
