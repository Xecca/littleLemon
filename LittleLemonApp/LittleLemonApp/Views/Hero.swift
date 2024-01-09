//
//  Hero.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 30.12.2023.
//

import SwiftUI

struct Hero: View {
    @Binding var searchText: String
    var isSearchEnable = false
    
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
                        .padding(.bottom, 1)
                    Spacer(minLength: 5)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist. And more we are serve than more we are happy..")
                        .lineLimit(3)
                        .foregroundStyle(.white)
                        .padding(1)
                }
                Image("heroImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120, alignment: .center)
            })
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            if isSearchEnable {
                Search(searchText: $searchText)
            }
        }
        .padding(.top, 10)
        .background(Color(UIColor(hex: 0x495E57)))
    }
}

//#Preview {
//    Hero(searchText: "")
//}
