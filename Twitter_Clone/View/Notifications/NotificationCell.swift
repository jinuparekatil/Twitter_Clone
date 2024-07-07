//
//  NotificationCell.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @State var width = UIScreen.main.bounds.width
    
    let notification: Notification
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
                    KFImage(URL(string: "http://localhost:3000/users/\(notification.notSenderId)/avatar"))
                        .placeholder({
                            Image("blankpp")
                                .resizable()
                        })
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36,height: 36)
                        .clipShape(Circle())
                    Text("\(notification.username) ")
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    +
                    Text(notification.notificationType.rawValue == "follow" ? NotificationType.follow.notificationMessage : NotificationType.like.notificationMessage)
                        .foregroundStyle(.black)
                    
                })
                Spacer(minLength: 0)
                
            })
            .padding(.leading,30)
            
        }
    }
}

//#Preview {
//    NotificationCell()
//}
