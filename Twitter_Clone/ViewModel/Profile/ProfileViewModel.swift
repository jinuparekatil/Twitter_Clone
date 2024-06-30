//
//  ProfileViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 30/06/2024.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    init(user: User) {
        self.user = user
    }
    
}
