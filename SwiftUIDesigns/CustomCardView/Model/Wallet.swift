//
//  Wallet.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 1/8/24.
//

import Foundation

struct Wallet: Identifiable {
    var id = UUID().uuidString
    var cardHolder: String
    var cardNumber: String
    var cardValidity: String
    var cardImage: String
}

var card1 = Wallet(cardHolder: "JENNA EZERIK", cardNumber: "0981 9816 1234 8763", cardValidity: "20-08-2028", cardImage: "background")
