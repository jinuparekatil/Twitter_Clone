//
//  RegisterView.swift
//  Twitter_Clone
//
//  Created by Jinu on 16/06/2024.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Cancel")
                            .foregroundStyle(.blue)
                    })
                    Spacer()
                }
                .padding(.horizontal)
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20,height: 20)
            }
            Text("Create your account")
                .font(.title)
                .bold()
                .padding(.top,35)
            
            VStack(alignment: .leading,spacing: nil, content: {
                CustomAuthTextField(placeHolder: "Name", text: $name)
                CustomAuthTextField(placeHolder: "Phone number or email", text: $email)
                SecureAuthTextField(placeHolder: "Password", text: $password)
            })
            
            Spacer(minLength: 0)
            
            VStack{
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(.gray)
                HStack {
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Capsule()
                            .frame(width: 60,height: 30,alignment: .center)
                            .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/255))
                            .overlay(
                                Text("Text")
                                    .foregroundStyle(.white)
                            )
                    })
                }
                .padding(.trailing,24)
            }
        }
    }
}

#Preview {
    RegisterView()
}
