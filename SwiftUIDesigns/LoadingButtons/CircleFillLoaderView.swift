//
//  CircleFillLoaderView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct CircleFillLoaderView: View {
    
    @State private var trimEnd: CGFloat = 0.0
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: trimEnd)
            .frame(width: 80, height: 80)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true)
                    , value: trimEnd
            )
            .onAppear {
                trimEnd = 1
            }
    }
}
#Preview {
    CircleFillLoaderView()
}
