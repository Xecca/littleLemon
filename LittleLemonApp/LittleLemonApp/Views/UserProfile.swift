//
//  UserProfile.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @StateObject private var viewModel = UserProfileViewModel()
    @State private var showImagePicker: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center, spacing: 20) {
                    if let image = viewModel.userImage {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80, alignment: .center)
                            .clipShape(.circle, style: FillStyle())
                    } else {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80, alignment: .center)
                    }

                    Button("Change") {
                        print("Avatar change!")
                        showImagePicker.toggle()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(UIColor(hex: 0x495E57)))
                    .cornerRadius(8)

                    Button("Remove") {
                        print("Avatar removed!")
                        viewModel.userImage = nil
                    }
                    .padding()
                    .foregroundColor(.gray)
                    .border(Color.black, width: 1)

                    Spacer()
                }
                .padding(.leading, 20)

                VStack(alignment: .leading) {
                    TextFieldView(fieldType: .text, title: "First Name", inputText: $viewModel.firstName)
                    TextFieldView(fieldType: .text, title: "Last Name", inputText: $viewModel.lastName)
                    TextFieldView(fieldType: .email, title: "Email", inputText: $viewModel.email)
                    TextFieldView(fieldType: .phoneNumber, title: "Phone Number", inputText: $viewModel.phone)
                }

                Button("Logout") {
                    UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                    presentation.wrappedValue.dismiss()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .cornerRadius(8)
                Spacer()

                HStack {
                    Button("Discard changes") {
                        print("Changes discarded!")
                        viewModel.setupContent()
                    }
                    .padding()
                    .foregroundColor(.gray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )

                    Button("Save changes") {
                        print("Changes saved!")
                        viewModel.saveChanges()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(UIColor(hex: 0x495E57)))
                    .cornerRadius(8)
                }
                .padding(.top, 20)
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $viewModel.userImage)
        }
    }
}


#Preview {
    UserProfile()
}
