//
//  WalletCardView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 1/8/24.
//

import SwiftUI

struct WalletCardView: View {
    var card: Wallet

    var body: some View {
        Image(card.cardImage)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .overlay(
                VStack(alignment: .leading, spacing: 10) {
                    Text(card.cardNumber)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(y: 25)
                    
                    Spacer()
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("CARD HOLDER")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Text(card.cardHolder)
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        
                        Spacer(minLength: 10)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("VALID TILL")
                                .font(.caption)
                                .fontWeight(.semibold)
                            
                            Text(card.cardValidity)
                        }
                        
                    }
                    .foregroundColor(.white)
                }
                    .padding()
            )
            .background(Color(.tertiarySystemFill))
            .cornerRadius(12)
    }
}

#Preview {
    WalletCardView(card: card1)
}
