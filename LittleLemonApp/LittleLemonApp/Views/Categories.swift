//
//  Categories.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct Categories: View {
    var categories = ["Starters", "Desserts", "Drinks", "Specials"]
    var body: some View {
        ScrollView (.horizontal) {
            HStack(spacing: 20) {
                ForEach(categories) { category in
                    Button("\(category)") {
                        print("\(category) tapped!")
                    }
                    .padding(10)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color(UIColor(hex: 0x495E57)))
                    .background(Color(UIColor(hex: 0xEDEFEE)))
                    .cornerRadius(10)
                }
                
            }
            .padding(.leading, 20)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    Categories()
}

extension String: Identifiable {
    public var id: String {
        self
    }
}
