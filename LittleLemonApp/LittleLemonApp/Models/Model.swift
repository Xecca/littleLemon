//
//  Model.swift
//  LittleLemonApp
//
//  Created by RedOrcDron on 12/22/23.
//

import Foundation

struct RestaurantLocation {
    let city: String
    let neighborhood: String
    let phoneNumber: String
}

class Model: ObservableObject {
    let restaurants = [
      RestaurantLocation(city: "Las Vegas",
                         neighborhood: "Downtown",
                         phoneNumber: "(702) 555-9898"),
      RestaurantLocation(city: "Los Angeles",
                         neighborhood: "North Hollywood",
                         phoneNumber: "(213) 555-1453"),
      RestaurantLocation(city: "Los Angeles",
                         neighborhood: "Venice",
                         phoneNumber: "(310) 555-1222"),
      RestaurantLocation(city: "Nevada",
                         neighborhood: "Venice",
                         phoneNumber: "(725) 555-5454"),
      RestaurantLocation(city: "San Francisco",
                         neighborhood: "North Beach",
                         phoneNumber: "(415) 555-1345"),
      RestaurantLocation(city: "San Francisco",
                         neighborhood: "Union Square",
                         phoneNumber: "(415) 555-9813")
    ]
}

struct User {
    var firstName: String
    var lastName: String
    var email: String
}
