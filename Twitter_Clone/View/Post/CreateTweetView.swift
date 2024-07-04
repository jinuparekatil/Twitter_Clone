//
//  CreateTweetView.swift
//  Twitter_Clone
//
//  Created by Jinu on 14/06/2024.
//

import SwiftUI

struct CreateTweetView: View {
    @State var text = ""
    
    @ObservedObject var viewmodel = CreateTweetViewModel()
    @Environment(\.presentationMode) var presentationMode

//    @Binding var show: Bool
    @State var imagePickerPresented = false
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()

                }, label: {
                    Text("Cancel")
                })
                Spacer()
                Button(action: {
                    if text != "" {
                        
                        self.viewmodel.uploadPost(text: text, image: selectedImage)
                        self.presentationMode.wrappedValue.dismiss()

                    }
                }, label: {
                    Text("Tweet")
                        .padding()
                        
                })
                .background(Color("bg"))
                .foregroundStyle(.white)
                .clipShape(Capsule())
                
            }
            MultilineTextField(text: $text)
            
            if postImage == nil {
                
                Button(action: {
                    self.imagePickerPresented.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70,height: 70)
                        .padding(.top)
                        .foregroundStyle(.black)
                })
                .sheet(isPresented: $imagePickerPresented){
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage )
                }
            }
           else if let image = postImage {
                VStack {
                    HStack(alignment: .top, content: {
                        image
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                            .frame(width: width * 0.9)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .clipped()
                    })
                    Spacer()
                }
            }
        }
        .padding()
    }
}
extension CreateTweetView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        postImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    CreateTweetView()
}
