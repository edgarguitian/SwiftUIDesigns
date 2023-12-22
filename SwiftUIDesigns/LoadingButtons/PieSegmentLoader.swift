//
//  PieSegmentLoader.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct PieSegment: Shape {
    var start: Angle
    var end: Angle
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.midX, startAngle: start, endAngle: end, clockwise: false)
        return path
    }
}

struct PieSegmentLoader: View {
    
    @State var degree: Double = 10
    @State var isFurther = true
    
    var body: some View {
        PieSegment(start: .zero, end: .degrees(degree))
            .frame(width: 80, height: 80)
            .animation(
                Animation.linear(duration: 3)
                    .repeatForever(autoreverses: false),
                value: degree
            )
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    withAnimation {
                        if isFurther {
                            if degree <= 360 {
                                degree += 1
                            }
                            if degree == 360 {
                                isFurther = false
                            }
                        } else {
                            if degree > 0 {
                                degree -= 1
                            }
                            if degree == 0 {
                                isFurther = true
                            }
                        }
                    }
                }
                RunLoop.current.add(timer, forMode: .common)
            }
    }
}

#Preview {
    PieSegmentLoader()
}
