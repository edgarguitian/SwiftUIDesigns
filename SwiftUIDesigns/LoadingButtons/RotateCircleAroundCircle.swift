//
//  RotateCircleAroundCircle.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct RotateCircleAroundCircle: View {
    @State private var angle: Double = 0
    var timeInterval: TimeInterval = 0.1
    var size: CGFloat = 80

    var body: some View {
        VStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .frame(width: size, height: size)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 10, height: 10)
                        .offset(
                            x: size/2 * CGFloat(cos(angle)),
                            y: size/2 * CGFloat(sin(angle))
                        )
                )
        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
                withAnimation {
                    angle += 0.1
                }
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}

#Preview {
    RotateCircleAroundCircle()
}
