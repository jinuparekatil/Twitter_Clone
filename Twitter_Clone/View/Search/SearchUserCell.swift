//
//  SearchUserCell.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack{
            Image("logo")
                .resizable()
                .frame(width: 44,height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading, content: {
                    Text("Jinu")
                        .fontWeight(.heavy)
                    Text("@jinu_joy")
                    
                })
        }
    }
}

#Preview {
    SearchUserCell()
}
