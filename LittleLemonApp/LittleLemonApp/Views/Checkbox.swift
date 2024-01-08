//
//  Checkbox.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 09.01.2024.
//

import SwiftUI

struct Checkbox: View {
    var title: String
    @Binding var isChecked: Bool
    var backgroundColor: Color = Color(UIColor(hex: 0x495E57))
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(.white)
                    .background(backgroundColor)
                    .cornerRadius(4)
                Text(title)
                    .foregroundColor(.primary)
            }
        }
    }
}

//#Preview {
//    Checkbox()
//}
