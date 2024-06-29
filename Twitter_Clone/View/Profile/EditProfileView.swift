//
//  EditProfileView.swift
//  Twitter_Clone
//
//  Created by Jinu on 29/06/2024.
//

import SwiftUI
import Kingfisher

struct EditProfileView: View {
    @State var profileImage: Image?
    @State  var selectedImage: UIImage?

    @State var isImagePickerPresented = false
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button {
                        
                    } label: {
                        Text("Cancel")
                            .foregroundStyle(.black)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("Save")
                            .foregroundStyle(.black)
                    }
                }
                .padding()
                HStack {
                    Spacer()
                    Text("Edit Profile")
                    Spacer()
                }
            }
            Image("banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: getRect().width,height: 180, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 0))
            if profileImage == nil {
                Button(action: {
                    self.isImagePickerPresented.toggle()
                }, label: {
                    KFImage(URL(string: "http://localhost:3000/users/id/avatar"))
                        .resizable()
                        .placeholder {
                            Image("blankpp")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 75,height: 75)
                                .clipShape(Circle())
                        }
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75,height: 75)
                        .clipShape(Circle())
                        .padding(8)
                        .background(.white)
                        .clipShape(Circle())
                        .offset(y: -20)
                        .padding(.leading,12)
                })
                .sheet(isPresented: $isImagePickerPresented, onDismiss: self.loadImage, content: {
                    ImagePicker(image: $selectedImage)
                })

            }
            else if let image = profileImage {
                VStack {
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75 , height: 75)
                            .clipShape(Circle())
                            .padding(8)
                            .background(.white)
                            .clipShape(Circle())
                            .offset(y: -20)
                           
                    }
                    .padding()
                }
                .padding(.leading,12)
            }
            Spacer()
        }
    }
}

extension EditProfileView {
    func loadImage() {
            guard let selectedImage = selectedImage else {
                print("jinu")
                return
            }
            print("jinu Joy")

            profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    EditProfileView()
}
