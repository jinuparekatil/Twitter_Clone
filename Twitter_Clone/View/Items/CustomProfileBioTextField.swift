//
//  CustomProfileBioTextField.swift
//  Twitter_Clone
//
//  Created by Jinu on 29/06/2024.
//

import SwiftUI

struct CustomProfileBioTextField: View {
   
    @Binding var bio: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .top, content: {
                if bio.isEmpty {
                    HStack {
                         Text("Add a bio to your profile")
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding(.top,8)
                    .padding(.leading,4)
                    .zIndex(1)
                }
                TextEditor(text: $bio)
                    .foregroundStyle(.blue)
            })
        }
        .frame(height: 90)
    }
}

