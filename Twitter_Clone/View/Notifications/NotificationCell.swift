//
//  NotificationCell.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI

struct NotificationCell: View {
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: width,height: 1,alignment: .center)
                .foregroundStyle(.gray)
                .opacity(0.3)
            HStack(alignment: .top
                   , content: {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundStyle(.blue)
                    .scaledToFit()
                    .frame(width: 20,height: 20)
                VStack(alignment: .leading,spacing: 5, content:{
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36,height: 36)
                        .clipShape(Circle())
                    Text("Jinu ")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    +
                    Text("Followed you")
                        .foregroundStyle(.black)
                    
                })
                Spacer(minLength: 0)
                
            })
            .padding(.leading,30)
            
        }
    }
}

#Preview {
    NotificationCell()
}
