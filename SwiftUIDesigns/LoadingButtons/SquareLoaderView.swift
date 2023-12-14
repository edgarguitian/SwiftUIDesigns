//
//  SquareLoaderView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct SquareLoaderView: View {
    @State private var xOffset: CGFloat = 40
    @State private var yOffset: CGFloat = -40
    var size: CGFloat = 80

    var body: some View {
        ZStack {
            Rectangle()
                .stroke(.black, lineWidth: 2)
                .frame(width: size, height: size)

            Circle()
                .fill(.white)
                .frame(width: 10, height: 10)
                .offset(x: xOffset, y: yOffset)
                .onAppear {
                    let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                        withAnimation {
                            if yOffset == -size/2 && xOffset != -size/2 {
                                self.xOffset += -1
                            } else if xOffset == -size/2 && yOffset != size/2 {
                                self.yOffset += 1
                            } else if yOffset == size/2 && xOffset != size/2 {
                                self.xOffset += +1
                            } else if xOffset == size/2 && yOffset != -size/2 {
                                self.yOffset += -1
                            }
                        }
                    }
                    RunLoop.current.add(timer, forMode: .common)
                }
        }
    }
}

#Preview {
    SquareLoaderView()
}
