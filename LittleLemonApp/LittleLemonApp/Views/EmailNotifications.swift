//
//  EmailNotifications.swift
//  LittleLemonApp
//
//  Created by Andrei Ponomarenko on 09.01.2024.
//

import SwiftUI

struct EmailNotifications: View {
    @StateObject var viewModel: UserProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email notifications")
                .font(.system(size: 20, weight: .heavy, design: .default))
                .padding(.bottom, 20)
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Checkbox(title: "Order statuses", isChecked: $viewModel.receiveOrderStatuses)
                    Checkbox(title: "Password changes", isChecked: $viewModel.receivePasswordChanges)
                    Checkbox(title: "Special offers", isChecked: $viewModel.receiveSpecialOffers)
                    Checkbox(title: "Newsletter", isChecked: $viewModel.receiveNewsletter)
                }
                Spacer()
            }
        }
        .padding(20)
    }
}
//
//#Preview {
//    EmailNotifications()
//}
