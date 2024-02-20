//
//  TipContentView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 29/12/23.
//

import SwiftUI
import TipKit

struct TipContentView: View {
    var body: some View {
        TipView()
            .task {
                try? Tips.resetDatastore()
                try? Tips.configure([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)
                ])
            }
    }
}

#Preview {
    TipContentView()
}
