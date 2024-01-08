//
//  Menu.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Dish.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Dish.title, ascending: true)
        ]
    ) var dishes: FetchedResults<Dish>
    @State private var searchText: String = ""
    @EnvironmentObject private var userProfileViewModel: UserProfileViewModel
    
    var body: some View {
        VStack {
            Header(viewModel: userProfileViewModel)
            Hero(searchText: $searchText)
            Breakdown()
            
            FetchedObjects(
                predicate: buildPredicate(),
                sortDescriptors: buildSortDescriptors()
            ) {
                (dishes: [Dish]) in
                ScrollView {
                    NavigationStack {
                        ForEach(dishes, id: \.self) { dish in
                            NavigationLink(destination: Details(dish: dish)) {
                                // MenuItemView
                                MenuItemView(dish: dish)

                            }
                            
                        }
                        .buttonStyle(PlainButtonStyle()) // Убираем стиль кнопки
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }
                .scrollIndicators(.hidden)
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
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    private func buildSortDescriptors() -> [NSSortDescriptor] {
        [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare)
            ),
            NSSortDescriptor(
                key: "price",
                ascending: false,
                selector: #selector(NSString.localizedStandardCompare)
            )
        ]
    }
    
    private func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        }
        return NSPredicate(format: "title CONTAINS[cd] %@",
                           searchText)
    }
}

#Preview {
    Menu()
}
