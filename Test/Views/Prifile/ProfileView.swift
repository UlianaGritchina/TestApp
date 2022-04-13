//
//  ProfileView.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var vm = ProfileViewViewModel()
    var body: some View {
        VStack {
            
            TitleView(title: "Profil Picture",
                      buttonTitle: "Edit",
                      editActoin: { vm.editProfilePhoto() })
            
            Image(uiImage: UIImage(data: vm.profileImageData) ?? UIImage(named: "startProfilPhoto")!)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 150, height: 100)
            
            LineView()
            
            TitleView(title: "Cover Photo" ,
                      buttonTitle: "Edit",
                      editActoin: { vm.editCoverPhoto()})
            
            Image(uiImage: UIImage(data: vm.coverImageData) ?? UIImage(named: "startCoverPhoto")!)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .frame(width: 345, height: 195)
            
            LineView()
            
            HStack {
                Text("Bio")
                    .bold()
                    .font(.system(size: 20))
                    
                Spacer()
                if vm.bio != "" {
                    Button(action: {
                        vm.editBio()
                        UIApplication.shared.endEditing()
                    }) {
                        Text("Save")
                            .foregroundColor(Color("ButtonColor"))
                    }
                }
            }
            .padding(.horizontal)
            
            TextField("Describe yourself...", text: $vm.bio)
                .multilineTextAlignment(.center)
            
            
            LineView()
            
            Spacer()
            
        }
        .sheet(isPresented: $vm.isShowingPhotoPicker) {
            PhotoPickerView(vm: vm)
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
    let buttonTitle: String
    let editActoin: () -> Void
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .font(.system(size: 20))
            Spacer()
            Button(action: editActoin) {
                Text(buttonTitle)
                    .foregroundColor(Color("ButtonColor"))
            }
        }.padding(.horizontal)
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}
