//
//  AnimatedStrokeRectangle.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct AnimatedStrokeRectangle: View {
    @State private var trimEnd: CGFloat = 0.0

    var body: some View {
        Rectangle()
            .trim(from: 0.0, to: trimEnd)
            .stroke(.white, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .frame(width: 80, height: 80)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true)
                    , value: trimEnd
            )
            .onAppear {
                self.trimEnd = 1.0
            }
    }
}

#Preview {
    AnimatedStrokeRectangle()
}
