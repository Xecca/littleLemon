//
//  OnboardingViewModel.swift
//  LittleLemonApp
//
//  Created by RedOrcDron on 12/22/23.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    private let kFirstName = "first name key"
    private let kLastName = "last name key"
    private let kEmail = "email key"
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
