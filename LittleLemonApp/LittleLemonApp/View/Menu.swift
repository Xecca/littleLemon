//
//  Menu.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Text("LittleLemonApp")
            Text("Chicago")
            Text("Little Lemon Restaurant in Chicago.")
            List {
                // Add items here
            }
        }
    }
}

#Preview {
    Menu()
}
