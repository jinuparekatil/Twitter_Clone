//
//  NotificationsView.swift
//  Twitter_Clone
//
//  Created by Jinu on 13/06/2024.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<9) { _ in
                NotificationCell()
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
