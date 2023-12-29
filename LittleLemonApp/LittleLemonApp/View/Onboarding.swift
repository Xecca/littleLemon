//
//  OnboardingView.swift
//  LittleLemonApp
//
//  Created by RedOrcDron on 12/21/23.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    @State var isLoggedIn = false
    @State private var isEmailValid = true
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        NavigationStack {
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
                    .focused($emailFieldIsFocused)
                    .disableAutocorrection(true)
                    .onTapGesture {
                        // Reset the validation message when the user taps on the TextField
                        isEmailValid = true
                    }
                    .onSubmit {
                        isEmailValid = isValidEmail(email: viewModel.user.email)
                    }
                    .autocapitalization(.none)
                
                HStack {
                    Spacer()
                    Button("Register") {
                        // Check if fields are not empty
                        if isValidEmail(email: viewModel.user.email) {
                            if !viewModel.user.firstName.isEmpty &&
                                !viewModel.user.lastName.isEmpty &&
                                !viewModel.user.email.isEmpty {
                                
                                // Optional: Check if email is valid (add your validation logic here)
                                
                                // Store user details using ViewModel method
                                viewModel.saveUserDetails()
                                
                                // Perform registration logic (you can customize this)
                                viewModel.registerUser()
                                
                                isLoggedIn = true
                                UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                            }
                        } else {
                            print("invalid email!!!")
                        }
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .navigationDestination(isPresented: $isLoggedIn) {
                        Home()
                    }
                    Spacer()
                }
            }
            .padding()
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            
        }
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
}

#Preview {
    OnboardingView()
}
