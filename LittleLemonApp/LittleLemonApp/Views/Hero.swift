//
//  Hero.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 30.12.2023.
//

import SwiftUI

struct Hero: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Little Lemon")
                    .foregroundStyle(.yellow)
                    .font(.system(size: 40, weight: .medium, design: .default))
                    .padding(.leading, 20)
                Spacer()
            }
            
            HStack(spacing: 20, content: {
                VStack(alignment: .leading) {
                    Text("Chicago")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist. And more we are serve than more we are happy..")
                        .lineLimit(3)
                        .foregroundStyle(.white)
                }
                Image("heroImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120, alignment: .center)
            })
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
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
        .padding(.top, 10)
        .background(Color(UIColor(hex: 0x495E57)))
    }
}

//#Preview {
//    Hero(searchText: "")
//}
