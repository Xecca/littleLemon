//
//  OnboardingViewModel.swift
//  LittleLemonApp
//
//  Created by RedOrcDron on 12/22/23.
//

import Foundation

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

class OnboardingViewModel: ObservableObject {
    @Published var user = User(firstName: "", lastName: "", email: "")
    
    func registerUser() {
        // Implement your registration logic here
        print("User registered: \(user.firstName) \(user.lastName), Email: \(user.email)")
    }
    
    func saveUserDetails() {
        // Store user details in UserDefaults
        UserDefaults.standard.set(user.firstName, forKey: kFirstName)
        UserDefaults.standard.set(user.lastName, forKey: kLastName)
        UserDefaults.standard.set(user.email, forKey: kEmail)
    }
}
