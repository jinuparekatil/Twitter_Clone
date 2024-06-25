//
//  ImagePicker.swift
//  Twitter_Clone
//
//  Created by Jinu on 25/06/2024.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate,UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image  = info[.originalImage] as? UIImage else { return }
            
            self.parent.image = image
            self.parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
}
