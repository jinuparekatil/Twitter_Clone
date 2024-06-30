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
    
    @Binding var user: User
    
    @State var name : String
    @State var location : String
    @State var bio : String
    @State var website : String
    
    init(user: Binding<User>) {
        self._user = user
        self._name = State(initialValue: _user.name.wrappedValue)
        self._location = State(initialValue: _user.location.wrappedValue ?? "")
        self._bio = State(initialValue: _user.bio.wrappedValue ?? "")
        self._website = State(initialValue: _user.website.wrappedValue ?? "")

    }
    
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
//                        .padding()
                    }
                    .padding(.leading,12)
                }
                    Spacer()
            }
            .onAppear {
                KingfisherManager.shared.cache.clearCache()
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

//#Preview {
//    EditProfileView()
//}
