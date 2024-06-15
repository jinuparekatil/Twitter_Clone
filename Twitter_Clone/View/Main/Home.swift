//
//  Home.swift
//  Twitter_Clone
//
//  Created by Jinu on 13/06/2024.
//

import SwiftUI

struct Home: View {
    @State var selectedIndex = 0
    @State var showCreateTweet = false
    @State var text = ""
    var body: some View {
        VStack {
            ZStack {
                TabView {
                    FeedView()
                        .onTapGesture {
                            self.selectedIndex = 0
                        }
                        .tabItem {
                            if(self.selectedIndex == 0) {
                                Image("Home")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color("bg"))
                            }
                            else {
                                Image("Home")
                            }
                           
                        }
                        .tag(0)
                    SearchView()
                        .onTapGesture {
                            self.selectedIndex = 1
                        }
                        .tabItem {
                            if(self.selectedIndex != 1) {
                                Image("Search")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color("bg"))
                            }
                            else {
                                Image("Search")
                            }
                            
                        }
                        .tag(1)
                    NotificationsView()
                        .onTapGesture {
                            self.selectedIndex = 2
                        }
                        .tabItem {
                            if(self.selectedIndex != 2) {
                                Image("Notifications")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color("bg"))
                            }
                            else {
                                Image("Notifications")
                            }
                            
                        }
                        .tag(2)
                    MessagesView()
                        .onTapGesture {
                            self.selectedIndex = 3
                        }
                        .tabItem {
                            if(self.selectedIndex != 3) {
                                Image("Messages")
                                    .renderingMode(.template)
                                    .foregroundStyle(Color("bg"))
                            }
                            else {
                                Image("Messages")
                            }
                            
                        }
                        .tag(3)
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showCreateTweet.toggle()
                        }, label: {
                            Image("tweet")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20,height: 20)
                                .padding()
                                .background(Color("bg"))
                                .foregroundStyle(.white)
                                .clipShape(Circle())
                    })
                    }
                    .padding()
                }
                .padding(.bottom,65)
                
            }
            .sheet(isPresented: $showCreateTweet, content: {
                CreateTweetView(text: text)
            })
        }
    }
}

#Preview {
    Home()
}
