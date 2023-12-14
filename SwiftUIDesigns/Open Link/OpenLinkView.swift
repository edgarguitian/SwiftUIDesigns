//
//  OpenLinkView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct OpenLinkView: View {
    var body: some View {
        VStack {
            Link(destination: URL(string: "https://www.apple.com")!, label: {
                Label("Go to Apple.com", systemImage: "safari.fill")
                    .padding()
                    .background(.quaternary)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .font(.largeTitle)
            })
            .padding(.top, 32)
            Spacer()
        }
    }
}

#Preview {
    OpenLinkView()
}
