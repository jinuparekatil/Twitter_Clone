//
//  WelcomeView.swift
//  Twitter_Clone
//
//  Created by Jinu on 16/06/2024.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    Image("Twitter")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20,height: 20)
                    Spacer(minLength: 0)
                }
                Spacer(minLength: 0)
                Text("See what's happening in the world right now.")
                    .font(.system(size: 30, weight: .heavy,design: .default))
                    .frame(width: (getRect().width*0.9),alignment: .center)
                Spacer(minLength: 0)
                VStack(alignment: .center,spacing: 10, content: {
                    Button(action: {
                        print("Signin with google")
                    }, label: {
                        HStack(spacing: nil, content: {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25,height: 25)
                            Text("Continue with Google")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundStyle(.black)
                                .padding()
                        })
                        .overlay(
                        RoundedRectangle(cornerRadius: 36 )
                            .stroke(.black,lineWidth: 1)
                            .opacity(0.3)
                            .frame(width: 320,height: 60,alignment: .center)
                        )
                    })
                    
                    Button(action: {
                        print("Signin with Apple")
                    }, label: {
                        HStack(spacing: nil, content: {
                            Image("apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25,height: 25)
                            Text("Continue with Apple")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundStyle(.black)
                                .padding()
                        })
                        .overlay(
                        RoundedRectangle(cornerRadius: 36 )
                            .stroke(.black,lineWidth: 1)
                            .opacity(0.3)
                            .frame(width: 320,height: 60,alignment: .center)
                        )
                    })
                    HStack {
                        Rectangle()
                            .foregroundStyle(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect()).width * 0.35,height: 1)
                        Text("Or")
                            .foregroundStyle(.gray)
                        Rectangle()
                            .foregroundStyle(.gray)
                            .opacity(0.3)
                            .frame(width: (getRect()).width * 0.35,height: 1)
                    }
                    RoundedRectangle(cornerRadius: 36)
                        .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                        .frame(width: 320,height: 60,alignment: .center)
                        .overlay(
                        Text("Create account")
                            .fontWeight(.bold)
                            .font(.title3)
                            .foregroundStyle(.white)
                            .padding()
                        
                        )
                })
                .padding()
                
                VStack(alignment: .leading, content: {
                    VStack {
                        Text("By signing up, you agree to our ") + Text("Terms")
                            .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255)) + Text(",") + Text(" Privacy Policy").foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255)) + Text(",") + Text(" Cookie Use").foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 2, content: {
                        Text("Have an account already? ")
                        Text("Log in").foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                    })
                })
            }
        }
        .toolbar(.hidden)
        .navigationTitle("")
    }
}

#Preview {
    WelcomeView()
}
