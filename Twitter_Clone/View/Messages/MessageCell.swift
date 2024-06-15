//
//  MessageCell.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI

struct MessageCell: View {
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Rectangle()
                .frame(width: width,height: 1,alignment: .center)
                .foregroundStyle(.gray)
                .opacity(0.3)
            HStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60,height: 60)
                    .clipShape(Circle())
                    .padding(.leading)
                VStack(alignment: .leading,spacing: 0, content: {
                    HStack {
                        
                        Text("Jinu")
                            .fontWeight(.bold)
                            .foregroundStyle(.primary)
                        Text("@jinu_joy")
                            .foregroundStyle(.gray)
                        
                        Spacer(minLength: 0)
                        
                        Text("15/06/2023")
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
                    Text("You: How is it going?")
                        .foregroundStyle(.gray)
                    Spacer()
                })
               
            }
            .padding(.top,2)
        })
        .frame(width: width,height: 84)
    }
}

#Preview {
    MessageCell()
}
