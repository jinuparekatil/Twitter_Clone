//
//  SearchView.swift
//  Twitter_Clone
//
//  Created by Jinu on 13/06/2024.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State var isEditing = false
    var body: some View {
        VStack {
            SearchBar(text: $text, isEditing: $isEditing)
                .padding(.horizontal)
            if !isEditing {
                List(0..<9) { i in
                Search_Cell(tags: "Hello", tweets: String(i))
                }
            }
            else {
                List(0..<9){_ in
                    
                    SearchUserCell()
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
