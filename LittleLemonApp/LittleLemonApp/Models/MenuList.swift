//
//  MenuList.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import Foundation

/*
{
    "menu": [
        {
            "id": 1,
            "title": "Greek Salad",
            "description": "The famous greek salad of crispy lettuce, peppers, olives, our Chicago.",
            "price": "10",
            "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true",
            "category": "starters"
        },
        {
            "id": 2,
            "title": "Lemon Desert",
            "description": "Traditional homemade Italian Lemon Ricotta Cake.",
            "price": "10",
            "image": "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/lemonDessert%202.jpg?raw=true",
            "category": "desserts"
        }
    ]
}
 */

struct MenuList: Decodable {
    let menu: [MenuItem]
}
