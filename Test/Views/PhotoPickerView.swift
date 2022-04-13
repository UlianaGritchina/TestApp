//
//  PhotoPicker.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

struct PhotoPickerView: UIViewControllerRepresentable {
    let vm: ProfileViewViewModel
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self, vm: vm)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPickerView
        let vm: ProfileViewViewModel
        
        init(photoPicker: PhotoPickerView, vm: ProfileViewViewModel) {
            self.photoPicker = photoPicker
            self.vm = vm
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.5) else {
                    return
                }
                if photoPicker.vm.pictureType == .profile {
                    DataManager.shared.saveProfileImage(data: data)
                    vm.profileImageData = data
                } else {
                    DataManager.shared.saveCoverImageData(data: data)
                    vm.coverImageData = data
                }
                
            } else {
                
            }
            picker.dismiss(animated: true)
        }
    }
    
}
