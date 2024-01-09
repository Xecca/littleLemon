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
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Hero(searchText: $searchText, isSearchEnable: false)
                TextFieldView(fieldType: .text, title: "First Name *", inputText: $viewModel.user.firstName)
                TextFieldView(fieldType: .text, title: "Last Name *", inputText: $viewModel.user.lastName)
                
                TextFieldView(fieldType: .email, title: "Email *", inputText: $viewModel.user.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .focused($emailFieldIsFocused)
                    .autocapitalization(.none)
                    .padding(.bottom, 8)
                
                HStack {
                    Spacer()
                    Button("Register") {
                        // Check if fields are not empty
                        if !viewModel.user.firstName.isEmpty &&
                            !viewModel.user.lastName.isEmpty &&
                            !viewModel.user.email.isEmpty {
                            
                            // Store user details using ViewModel method
                            viewModel.saveUserDetails()
                            
                            // Perform registration logic
                            viewModel.registerUser()
                            
                            isLoggedIn = true
                            UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                        } else {
                            print("invalid inputed data!!!")
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
}

#Preview {
    OnboardingView()
}
