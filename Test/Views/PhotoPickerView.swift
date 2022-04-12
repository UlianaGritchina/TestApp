//
//  PhotoPicker.swift
//  Test
//
//  Created by Ульяна Гритчина on 12.04.2022.
//

import SwiftUI

struct PhotoPickerView: UIViewControllerRepresentable {
    
    let pictureType: Picture
    @Binding var profileImage: UIImage
    @Binding var coverImage: UIImage
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPickerView
        
        init(photoPicker: PhotoPickerView) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.5), let commpresedImage = UIImage(data: data) else {
                    return
                }
                if photoPicker.pictureType == .profile {
                    photoPicker.profileImage = commpresedImage
                } else {
                    photoPicker.coverImage = commpresedImage
                }
                
            } else {
                
            }
            picker.dismiss(animated: true)
        }
    }
    
}
