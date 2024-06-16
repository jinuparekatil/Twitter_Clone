//
//  TabButtons.swift
//  Twitter_Clone
//
//  Created by Jinu on 16/06/2024.
//

import SwiftUI

struct TabButtons: View {
    var title: String
    @Binding var currentTab: String
    var animation : Namespace.ID
    var body: some View {
        Button {
            
        } label: {
            LazyVStack(spacing: 12){
                    Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(currentTab == title ? .blue : .gray)
                    .padding(.horizontal)
                if(currentTab == title) {
                    Capsule()
                        .fill(Color.blue)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 1.2)
                }
                }
           
        }

    }
}

