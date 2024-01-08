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
    @FocusState private var emailFieldIsFocused: Bool
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("\(title.capitalized)")
                .font(.headline)
                .foregroundColor(Color(UIColor(hex: 0x495E57)))
            switch fieldType {
            case .text:
                TextField("\(title)", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            case .phoneNumber:
                TextField("\(title)", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            case .email:
                TextField("\(title)", text: $inputText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .focused($emailFieldIsFocused)
                    .disableAutocorrection(true)
                    .onTapGesture {
                        // Reset the validation message when the user taps on the TextField
                        isEmailValid = true
                    }
                    .onSubmit {
                        isEmailValid = isValidEmail(email: inputText)
                    }
                    .autocapitalization(.none)
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
