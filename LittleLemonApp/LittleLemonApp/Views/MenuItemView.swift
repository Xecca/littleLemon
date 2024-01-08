//
//  MenuItemView.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 30.12.2023.
//

import SwiftUI

struct MenuItemView: View {
    @State var dish: Dish
    
    var body: some View {
        VStack {
            Divider().padding(.horizontal, 20)
            HStack {
                VStack(alignment: .leading, spacing: 20, content: {
                    Text("\(dish.title.capitalized)")
                        .font(.headline)
                        .foregroundColor(.primary)
                    Text("\(dish.descriptionText ?? "")")
                        .font(.caption)
                        .foregroundStyle(Color.secondary)
                        .lineLimit(2)
                    Text("$\(dish.price ?? "$0")")
                        .font(.bold(.subheadline)())
                        .foregroundColor(Color(UIColor(hex: 0x495E57)))
                })
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading) // Равная ширина для VStack
                .padding(.leading, 20) // Отступ слева
                
                AsyncImage(url: URL(string: dish.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.Image.width, height: Constants.Image.height) // Adjust the size as needed
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: Constants.Image.width, height: Constants.Image.height) // Adjust the size as needed
                    @unknown default:
                        fatalError("Unknown async image loading state")
                    }
                }
                .frame(width: Constants.Image.width, height: Constants.Image.height)
                .padding(.trailing, 20)
            }
            .padding(.top, 10)
            .padding(.bottom, 10)
        }
    }
}

//#Preview {
//    MenuItemView()
//}

fileprivate enum Constants {
    enum Image {
        static let height = 80.0
        static let width = 80.0
    }
}
