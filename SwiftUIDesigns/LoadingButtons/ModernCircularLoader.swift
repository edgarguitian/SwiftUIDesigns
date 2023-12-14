//
//  ModernCircularLoader.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ModernCircularLoader: View {
    @State private var trimEnd = 0.6
    @State private var animate = false
    
    var body: some View {
        Circle()
            .trim(from: 0.0,to: trimEnd)
            .stroke(.white, style: StrokeStyle(lineWidth: 7,lineCap: .round,lineJoin:.round))
            .animation(
                Animation.easeIn(duration: 1.5)
                    .repeatForever(autoreverses: true),
                value: trimEnd
            )
            .frame(width: 70,height: 70)
            .rotationEffect(Angle(degrees: animate ? 270 + 360 : 270))
            .animation(
                Animation.linear(duration: 1)
                    .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear{
                animate = true
                trimEnd = 0
            }
    }
}

#Preview {
    ModernCircularLoader()
}
