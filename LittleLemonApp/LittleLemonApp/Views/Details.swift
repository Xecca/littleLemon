//
//  Details.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct Details: View {
    let dish: Dish
    var body: some View {
        VStack {
            Text("Details for Dish: \(dish.title)")
            // Add more details or custom UI for the selected dish
        }
        .navigationBarTitle("\(dish.title) Details", displayMode: .inline)
    }
}

#Preview {
    Details(dish: Dish())
}
