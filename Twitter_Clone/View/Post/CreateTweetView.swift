//
//  CreateTweetView.swift
//  Twitter_Clone
//
//  Created by Jinu on 14/06/2024.
//

import SwiftUI

struct CreateTweetView: View {
    @State var text = ""
    
    @ObservedObject var viewmodel = CreateTweetViewModel()
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Text("Cancel")
                })
                Spacer()
                Button(action: {
                    if text != "" {
                        
                        self.viewmodel.uploadPost(text: text)
                    }
                }, label: {
                    Text("Tweet")
                        .padding()
                        
                })
                .background(Color("bg"))
                .foregroundStyle(.white)
                .clipShape(Capsule())
                
            }
            MultilineTextField(text: $text)
        }
        .padding()
    }
}

#Preview {
    CreateTweetView()
}
