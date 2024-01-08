//
//  Header.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 30.12.2023.
//

import SwiftUI

struct Header: View {
    @ObservedObject var viewModel: UserProfileViewModel
    
    var body: some View {
        HStack {
            Spacer()
            Image("littleLemon")
                .resizable()
                .scaledToFit()
                .frame(height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.trailing, 20)
            
            if let userImage = viewModel.userImage {
                Image(uiImage: userImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(.circle, style: FillStyle())
                    .padding(.trailing, 20)
            } else {
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60, alignment: .center)
                    .clipShape(.circle, style: FillStyle())
                    .padding(.trailing, 20)
            }
        }
    }
}

//#Preview {
//    Header()
//}
