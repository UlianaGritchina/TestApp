//
//  ProfileView.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

enum Picture {
    case profile
    case cover
}

struct ProfileView: View {
    @State private var isShowingPhotoPicker = false
    @State private var profileImage = UIImage(named: "startProfilPhoto")!
    @State private var coverImage = UIImage(named: "startCoverPhoto")!
    @State private var pictureType = Picture.profile
    var body: some View {
        VStack {
            
            TitleView(title: "Profil Picture", editActoin: {
                pictureType = .profile
                isShowingPhotoPicker.toggle()
            })
            
            Image(uiImage: profileImage)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 150, height: 100)
                
            LineView()
            
            TitleView(title: "Cover Photo",
                      editActoin: {
                pictureType = .cover
                isShowingPhotoPicker.toggle()
            })
            
            Image(uiImage: coverImage)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 345, height: 195)
                
            LineView()
            
            TitleView(title: "Bio", editActoin: {})
            
            
            TextField("Describe yourself...", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            
            LineView()
            
            Spacer()

        }
        .sheet(isPresented: $isShowingPhotoPicker) {
            PhotoPickerView(pictureType: pictureType,
                            profileImage: $profileImage,
                            coverImage: $coverImage)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct TitleView: View {
    let title: String
    let editActoin: () -> Void
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .font(.system(size: 20))
            Spacer()
            Button(action: editActoin) {
                Text("Edit")
                    .foregroundColor(Color("ButtonColor"))
            }
        }.padding(.horizontal)
    }
}


