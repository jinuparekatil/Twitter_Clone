//
//  MultilineTextField.swift
//  Twitter_Clone
//
//  Created by Jinu on 14/06/2024.
//

import SwiftUI

struct MultilineTextField: UIViewRepresentable {
    
    @Binding var text: String
    func makeCoordinator() -> MultilineTextField.coordinator {
        return MultilineTextField.coordinator(parent: self)
    }
    func makeUIView(context: Context) -> some UITextView {
        let text = UITextView()
        text.text = "Enter something"
        text.isUserInteractionEnabled = true
        text.textColor = .gray
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
        return text
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class coordinator: NSObject,UITextViewDelegate {
        var parent: MultilineTextField
        init(parent: MultilineTextField) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
