//
//  Breakdown.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 30.12.2023.
//

import SwiftUI

struct Breakdown: View {
    var body: some View {
        VStack {
            HStack {
                Text("Order for delivery!".uppercased())
                    .font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
            }
            .padding(20)
            Categories()
        }
    }
}

#Preview {
    Breakdown()
}
