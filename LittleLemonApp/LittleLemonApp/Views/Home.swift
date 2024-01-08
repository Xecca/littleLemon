//
//  Home.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 29.12.2023.
//

import SwiftUI

struct Home: View {
    let persistenceController = PersistenceController.shared
    @StateObject private var userProfileViewModel = UserProfileViewModel()
    
    var body: some View {
        
        TabView {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(userProfileViewModel)
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
                .environmentObject(userProfileViewModel)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}
