//
//  Menu.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

// https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Dish.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Dish.title, ascending: true)
        ]
    ) var dishes: FetchedResults<Dish>
    
    var body: some View {
        VStack {
            Text("LittleLemonApp")
            Text("Chicago")
            Text("Little Lemon Restaurant in Chicago.")
            FetchedObjects(
                predicate: buildPredicate(),
                //                sortDescriptors: buildSortDescriptors()) {
                sortDescriptors: []) {
                    (dishes: [Dish]) in
                    NavigationStack {
                        List {
                            ForEach(dishes, id:\.self) { dish in
                                NavigationLink(destination: Details(dish: dish)) {
                                    HStack {
                                        Text("Dish: \(dish.title)")
                                            .font(.headline)
                                            .foregroundColor(.primary)
                                        AsyncImage(url: URL(string: dish.image)) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50) // Adjust the size as needed
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 50, height: 50) // Adjust the size as needed
                                            @unknown default:
                                                fatalError("Unknown async image loading state")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .onAppear {
                    getMenuData()
                }
        }
    }
    
    func getMenuData() {
        let serverURLString = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        
        guard let url = URL(string: serverURLString) else { return }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(MenuList.self, from: data)
                    
                    // Clear the database
                    PersistenceController.shared.clear()
                    
                    for menuItem in result.menu {
                        let dish = Dish(context: viewContext)
                        dish.id = String(menuItem.id)
                        dish.title = menuItem.title
                        dish.image = menuItem.image
                        dish.price = menuItem.price
                        dish.category = menuItem.category
                        dish.descriptionText = menuItem.description ?? ""
                        
                        // Save the data into the database
                        try? viewContext.save()
                    }
                    print(result)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    private func buildPredicate() -> NSPredicate {
        NSPredicate(value: true)
    }
}

#Preview {
    Menu()
}
