//
//  SearchUserCell.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI
import Kingfisher

struct SearchUserCell: View {
    let user: User
    var body: some View {
        HStack{
            KFImage(URL(string: "http://localhost:3000/user/\(self.user.id)/avatar"))
                .placeholder({
                    Image("blankpp")
                        .resizable()
                })
                .resizable()
                .scaledToFit()
                .frame(width: 44,height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading, content: {
                Text(user.name)
                        .fontWeight(.heavy)
                        .foregroundStyle(.black)
                Text("@\(user.username)")
                    .foregroundStyle(.black)
                    
                })
            Spacer(minLength: 0)
        }
    }
}

//#Preview {
//    SearchUserCell()
//}
