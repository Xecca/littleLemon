//
//  UserProfileViewModel.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 09.01.2024.
//

import SwiftUI

class UserProfileViewModel: ObservableObject {
    @Published var firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? "Unknown"
    @Published var lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? "Unknown"
    @Published var email: String = UserDefaults.standard.string(forKey: kEmail) ?? "Unknown"
    @Published var phone: String = ""
    @Published var userImage: UIImage? = {
        if let imagePath = UserDefaults.standard.string(forKey: kUserProfileImagePath) {
            return UIImage(contentsOfFile: imagePath)
        }
        return UIImage(named: "profile-image-placeholder")
    }()
    
    @Published var receiveOrderStatuses: Bool = true
    @Published var receivePasswordChanges: Bool = true
    @Published var receiveSpecialOffers: Bool = true
    @Published var receiveNewsletter: Bool = true
    
    func setupContent() {
        firstName = UserDefaults.standard.string(forKey: kFirstName) ?? "Unknown"
        lastName = UserDefaults.standard.string(forKey: kLastName) ?? "Unknown"
        email = UserDefaults.standard.string(forKey: kEmail) ?? "Unknown"
        phone = ""
        
        if let imagePath = UserDefaults.standard.string(forKey: kUserProfileImagePath),
           let image = UIImage(contentsOfFile: imagePath) {
            userImage = image
        } else {
            userImage = UIImage(named: "profile-image-placeholder")
        }
    }
    
    func saveChanges() {
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        
        if let image = userImage {
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let filename = documentsDirectory.appendingPathComponent(kUserProfileImageFilename)
                
                do {
                    try image.jpegData(compressionQuality: 1.0)?.write(to: filename)
                    UserDefaults.standard.set(filename.path, forKey: kUserProfileImagePath)
                } catch {
                    print("Error saving image to file: \(error.localizedDescription)")
                }
            }
        } else {
            UserDefaults.standard.set(nil, forKey: kUserProfileImagePath)
        }
    }
}
