//
//  NotificationsView.swift
//  Twitter_Clone
//
//  Created by Jinu on 13/06/2024.
//

import SwiftUI

struct NotificationsView: View {
    var user: User
    @ObservedObject var viewModel: NotificationsViewModel
    init(user: User) {
        self.user = user
        self.viewModel = NotificationsViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.notifications) { notification in
                NotificationCell(notification: notification)
                }
            }
        }
    }
}

