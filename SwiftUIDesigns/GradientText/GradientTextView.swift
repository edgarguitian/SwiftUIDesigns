//
//  GradientTextView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct GradientTextView: View {
    let text = "SwiftUI is a good tool for Designers"
    var body: some View {
        Text(text).font(Font.largeTitle.bold())
            .foregroundColor(.clear)
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [.orange, .red, .purple, .blue]),
                    startPoint: .trailing,
                    endPoint: .leading
                )
                .mask(Text(text)))
            .padding(16)
        
    }
}

#Preview {
    GradientTextView()
}
