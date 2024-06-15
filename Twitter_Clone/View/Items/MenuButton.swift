//
//  MenuButton.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI

struct MenuButton: View {
    var title: String
    var body: some View {
        HStack(spacing: 15, content: {
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24,height: 24)
                .foregroundStyle(.gray)
                Text(title)
                    .foregroundStyle(.black)
                Spacer(minLength: 0)
        })
        .padding(.vertical,12)
    }
    
}

//#Preview {
//    MenuButton(title: "Love")
//}
