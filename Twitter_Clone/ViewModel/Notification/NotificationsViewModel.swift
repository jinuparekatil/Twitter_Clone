//
//  NotificationCellViewModel.swift
//  Twitter_Clone
//
//  Created by Jinu on 06/07/2024.
//

import Foundation

class NotificationsViewModel: ObservableObject {
    @Published var notifications = [Notification]()
    var user: User
    init(user: User) {
        self.user = user
        fetchNotifications()
    }
    
    func fetchNotifications() {
        RequestServices.requestDomain = "http://localhost:3000/notifications/\(self.user.id)"
        
        RequestServices.fetchData { result in
            switch result {
            case .success(let data):
                guard let jsonData = data as? Data else {
                    print("Failed to cast data to Data type")
                    return
                }

                do {
                    self.notifications = try JSONDecoder().decode([Notification].self, from: jsonData)
                    // Successfully decoded
                    print(self.notifications)
                    
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
               
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
