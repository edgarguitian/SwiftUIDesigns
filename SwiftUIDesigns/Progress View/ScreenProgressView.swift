//
//  ScreenProgressView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ScreenProgressView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ProgressView(value: 0.25) { Text("25% progress") }
                ProgressView(value: 0.75) { Text("75% progress") }
                ProgressView(value: 1.00) { Text("100% progress") }
            }
            .tint(.black)
            .padding()
            .navigationTitle("Progress View")
            Spacer()
        }
    }
}

#Preview {
    ScreenProgressView()
}
