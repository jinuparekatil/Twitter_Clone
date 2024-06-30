//
//  EditProfileViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 30/06/2024.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: User
    init(user: User) {
        self.user = user
    }
    
    func save(name: String?,bio: String?, website: String?, location: String?) {
        
        guard let name = name else { return }
        guard let bio = bio else { return }
        guard let website = website else { return }
        guard let location = location else { return }
        
        self.user.name = name
        self.user.bio = bio
        self.user.website = website
        self.user.location = location
        
    }
}
