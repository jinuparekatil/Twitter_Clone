//
//  CustomProfileTextField.swift
//  Twitter_Clone
//
//  Created by Jinu on 29/06/2024.
//

import SwiftUI

struct CustomProfileTextField: View {
    @Binding  var message: String
    var placeholder: String
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    if message.isEmpty {
                        Text(placeholder)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                }
                TextField("",text: $message)
                    .foregroundStyle(.blue)
            }
        }
    }
}

