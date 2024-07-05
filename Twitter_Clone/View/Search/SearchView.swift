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
    @ObservedObject var viewModel = SearchViewModel()
    var users: [User] {
        self.text.isEmpty ? viewModel.users : viewModel.filteredUsers(text)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                SearchBar(text: $text, isEditing: $isEditing)
                    .padding(.horizontal)
                LazyVStack {
                    ForEach(self.users) { user in
                        NavigationLink {
                            UserProfile(user: user)
                        } label: {
                            
                            
                            SearchUserCell(user: user)
                                .padding(.leading)
                        }
                    }
                }
                    
                }
            }
        }
    
}

#Preview {
    SearchView()
}
