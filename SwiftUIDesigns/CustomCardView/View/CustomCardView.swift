//
//  CustomCardView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 1/8/24.
//

import SwiftUI

struct CustomCardView: View {
    var body: some View {
        List {
            PersonCardView(person: person1)
                .listRowSeparator(.hidden)
            
            WalletCardView(card: card1)
                .listRowSeparator(.hidden)
        }
    }
}

#Preview {
    CustomCardView()
}
