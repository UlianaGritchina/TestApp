//
//  ProfileViewViewModel.swift
//  Test
//
//  Created by Ульяна Гритчина on 13.04.2022.
//

import Foundation

enum Picture {
    case profile
    case cover
}

class ProfileViewViewModel: ObservableObject {
    
    @Published var profileImageData = DataManager.shared.getProfileImageData()
    @Published var coverImageData = DataManager.shared.getCoverImageData()
    @Published var isShowingPhotoPicker = false
    @Published var pictureType = Picture.profile
    @Published var bio = DataManager.shared.getBio() ?? ""
    
    func editCoverPhoto() {
        pictureType = .cover
        isShowingPhotoPicker.toggle()
    }
    
    func editProfilePhoto() {
        pictureType = .profile
        isShowingPhotoPicker.toggle()
    }
    
    func editBio()  {
        DataManager.shared.save(bio: bio)
    }
}
