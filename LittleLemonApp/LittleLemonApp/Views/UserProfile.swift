//
//  UserProfile.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    @State var firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? "Unknown"
    @State var lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? "Unknown"
    @State var email: String = UserDefaults.standard.string(forKey: kEmail) ?? "Unknown"
    @State var phone: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Personal information")
                    .font(.title)
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    TextFieldView(fieldType: .text, title: "First Name", inputText: $firstName)
                    TextFieldView(fieldType: .text, title: "Last Name", inputText: $lastName)
                    TextFieldView(fieldType: .email, title: "Email", inputText: $email)
                    TextFieldView(fieldType: .phoneNumber, title: "Phone Number", inputText: $phone)
                }
                
                
                Button("Logout") {
                    UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
                Spacer()
            }
        }
    }
}

#Preview {
    UserProfile()
}
