//
//  SearchBar.swift
//  Twitter_Clone
//
//  Created by Jinu on 14/06/2024.
//

import SwiftUI


struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing : Bool
    var body: some View {
        HStack {
            TextField("Search Twitter", text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay (
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            .padding(.leading,8)
                    }
                )
            Button(action: {
                isEditing = false
                text = ""
                UIApplication.shared.endEditing()
            }, label: {
                Text("Cancel")
                    .foregroundStyle(.black)
                    .padding(.trailing,8)
                    .transition(.move(edge: .trailing))
                    .animation(.default, value: isEditing)
            })
        }
        .onTapGesture {
            isEditing = true
        }
    }
        
    
}

#Preview {
    SearchBar(text: .constant("Jinu"), isEditing: .constant(false))
}
