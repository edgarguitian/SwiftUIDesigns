//
//  ContentUnavailableNoMailView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ContentUnavailableNoMailView: View {
    var body: some View {
            ContentUnavailableView(label: {
                Label("No Mail", systemImage: "tray.fill")
            }, description: {
                Text("New mails you receive will appear here.")
            }, actions: {
                Button(action: {
                    print("Refresh")
                }) {
                    Text("Refresh")
                }
                .buttonStyle(.borderedProminent)
                .font(.system(size: 20))
            })
            .preferredColorScheme(.dark)
        }
}

#Preview {
    ContentUnavailableNoMailView()
}
