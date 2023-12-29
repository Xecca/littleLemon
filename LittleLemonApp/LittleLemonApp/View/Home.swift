//
//  Home.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct Home: View {
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
