//
//  OnboardingView.swift
//  LittleLemonApp
//
//  Created by RedOrcDron on 12/21/23.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            TextField("First Name", text: $viewModel.user.firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Last Name", text: $viewModel.user.lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Email", text: $viewModel.user.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .padding()
            
            HStack {
                Spacer()
                Button("Register") {
                    // Check if fields are not empty
                    if viewModel.user.firstName.isEmpty &&
                        viewModel.user.lastName.isEmpty &&
                        viewModel.user.email.isEmpty {
                        
                        // Optional: Check if email is valid (add your validation logic here)
                        
                        // Store user details using ViewModel method
                        viewModel.saveUserDetails()
                        
                        // Perform registration logic (you can customize this)
                        viewModel.registerUser()
                    }
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(8)
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    OnboardingView()
}
