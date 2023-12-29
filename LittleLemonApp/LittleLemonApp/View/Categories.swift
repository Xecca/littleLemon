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
            HStack {
                ForEach(categories) { category in
                    Text(category)
                        .fixedSize()
                }
            }
        }
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
