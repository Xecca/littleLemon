//
//  TextFieldView.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 08.01.2024.
//

import SwiftUI

enum FieldType {
    case text
    case phoneNumber
    case email
}

struct TextFieldView: View {
    let fieldType: FieldType
    let title: String
    @Binding var inputText: String
    @State private var isEmailValid = true
    @State private var showErrorMessage = false
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("\(title.capitalized)")
                .font(.headline)
                .foregroundColor(Color(UIColor(hex: 0x495E57)))
            switch fieldType {
            case .text, .phoneNumber:
                TextField("\(title)", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            case .email:
                TextField("\(title)", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .onTapGesture {
                        // Reset the validation message when the user taps on the TextField
                        isEmailValid = true
                        showErrorMessage = false
                    }
                    .onChange(of: inputText) { newValue, _ in
                        isEmailValid = isValidEmail(email: newValue)
                        showErrorMessage = !isEmailValid
                    }
                    .autocapitalization(.none)
            }
            if showErrorMessage {
                withAnimation() {
                    Text("Invalid email")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
        })
        .padding()
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailPredicate.evaluate(with: email)
    }
}

//#Preview {
//    TextFieldView()
//}
