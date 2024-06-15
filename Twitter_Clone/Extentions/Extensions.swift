//
//  Extensions.swift
//  Twitter_Clone
//
//  Created by Jinu on 15/06/2024.
//

import UIKit

extension UIApplication {
    func endEditing() {
        
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
