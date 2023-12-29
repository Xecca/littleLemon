//
//  UserProfile.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    let firstName: String = UserDefaults.standard.string(forKey: kFirstName) ?? "Unknown"
    let lastName: String = UserDefaults.standard.string(forKey: kLastName) ?? "Unknown"
    let email: String = UserDefaults.standard.string(forKey: kEmail) ?? "Unknown"
    
    
    var body: some View {
        VStack {
            Text("Personal information")
                .font(.title)
            Image("profile-image-placeholder")
                .resizable()
                .frame(width: 100, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            HStack( content: {
                Text("First name:")
                Text("\(firstName) sdfsdfs")
                    .bold()
                Spacer()
            })
            .padding(.top, 20)
            .padding(.leading, 20)
            
            HStack {
                Text("Last name:")
                Text("\(lastName)")
                    .bold()
                Spacer()
            }
            .padding(.leading, 20)
            HStack {
                Text("Email:")
                Text("\(email)")
                    .bold()
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.bottom, 20)
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

#Preview {
    UserProfile()
}
