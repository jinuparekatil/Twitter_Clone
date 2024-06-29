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
    
    @State var name = ""
    @State var location = ""
    @State var bio = ""
    @State var website = ""
    
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
                        .fontWeight(.heavy)
                    Spacer()
                }
            }
            VStack {
                Image("banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getRect().width,height: 180, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 0))
           
            HStack {
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
            .padding(.top, -25)
            .padding(.bottom, -10)
            VStack {
                Divider()
                HStack {
                    ZStack {
                        HStack {
                            Text("Name")
                                .foregroundStyle(.black)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        CustomProfileTextField(message: $name, placeholder: "Add your name")
                            .padding(.leading,90)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                HStack {
                    ZStack {
                        HStack {
                            Text("Location")
                                .foregroundStyle(.black)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        CustomProfileTextField(message: $location, placeholder: "Add your location")
                            .padding(.leading,90)
                    }
                }
                .padding(.horizontal)
                Divider()
                HStack {
                    ZStack(alignment: .topLeading, content: {
                        HStack {
                            Text("Bio")
                                .foregroundStyle(.black)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        CustomProfileBioTextField(bio: $bio)
                            .padding(.leading,86 )
                            .padding(.top , -6)
                    })
                }
                .padding(.horizontal)
                Divider()
                HStack {
                    ZStack {
                        HStack {
                            Text("website")
                                .foregroundStyle(.black)
                                .fontWeight(.heavy)
                            Spacer()
                        }
                        CustomProfileTextField(message: $website, placeholder: "Add your website")
                            .padding(.leading,90)
                    }
                }
                .padding(.horizontal)

            }
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
