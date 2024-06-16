//
//  SecureAuthTextField.swift
//  Twitter_Clone
//
//  Created by Jinu on 16/06/2024.
//

import SwiftUI

struct SecureAuthTextField: View {
    var placeHolder: String
    @Binding var text: String
    var body: some View {
        VStack {
            ZStack(alignment: .leading, content: {
                if text.isEmpty {
                    Text(placeHolder)
                        .foregroundStyle(.gray)
                }
                SecureField("",text: $text)
                    .frame(height: 45)
                    .foregroundStyle(Color(red: 29/255, green: 161/255, blue: 242/355))
            })
            Rectangle()
                .frame(height: 1,alignment: .center)
                .foregroundStyle(.gray)
                .padding(.top,-2)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SecureAuthTextField(placeHolder: "placeholder", text: .constant(""))
}
