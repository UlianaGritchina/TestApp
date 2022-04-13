//
//  UserDefoltsDataManager.swift
//  Test
//
//  Created by Ульяна Гритчина on 13.04.2022.
//

import Foundation

class DataManager: ObservableObject {
    
    static var shared = DataManager()
    private init() {}
    
    func save(bio: String) {
        UserDefaults.standard.set(bio, forKey: "Bio")
    }
    
    func getBio() -> String? {
        UserDefaults.standard.string(forKey: "Bio")
    }
    
    func saveProfileImage(data: Data) {
        UserDefaults.standard.set(data, forKey: "ProfileImageData")
    }
    
    func getProfileImageData() -> Data {
        UserDefaults.standard.data(forKey: "ProfileImageData") ?? Data()
    }
    
    func saveCoverImageData(data: Data) {
        UserDefaults.standard.set(data, forKey: "CoverImageData")
    }
    
    func getCoverImageData() -> Data {
        UserDefaults.standard.data(forKey: "CoverImageData") ?? Data()
    }
}
