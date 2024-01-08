//
//  MenuItem.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import Foundation

struct MenuItem: Decodable, Hashable {
    let id: Int
    let title: String
    let image: String
    let price: String
    let description: String?
    let category: String
}
