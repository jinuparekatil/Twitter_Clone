//
//  FollowView.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import SwiftUI

struct FollowView: View {
    var count: Int
    var title: String
    var body: some View {
        HStack {
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundStyle(.black)
            Text(title)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    FollowView(count: 10, title: "Following")
}
