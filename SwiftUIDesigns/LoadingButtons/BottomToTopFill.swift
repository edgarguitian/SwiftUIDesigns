//
//  BottomToTopFill.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct BottomToTopFill: View {
    @State var offset: CGFloat = 80
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.clear)
                .frame(width: 80, height: 80)
                .overlay {
                    Circle()
                        .stroke(.white)
                }
            
            Rectangle()
                .fill(.white)
                .frame(width: 80, height: 80)
                .offset(y: offset)
        }
        .clipShape(.circle)
        .animation(
            Animation.linear(duration: 3)
                .repeatForever(autoreverses: true),
            value: offset
        )
        .onAppear {
            offset = 0
        }
    }
}

#Preview {
    BottomToTopFill()
}
