//
//  ContentUnavailableNoInboxView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ContentUnavailableNoInboxView: View {
    var body: some View {
        ContentUnavailableView("Your inbox is empty",
                               systemImage: "message.fill",
                               description: Text("Please start a new conversation"))
        .symbolRenderingMode(.multicolor)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentUnavailableNoInboxView()
}
