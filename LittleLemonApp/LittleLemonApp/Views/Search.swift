//
//  Search.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 09.01.2024.
//

import SwiftUI

struct Search: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)
            
            TextField("Search Menu", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.trailing, 10)
        }
        .padding(20)
    }
}

//#Preview {
//    Search()
//}
