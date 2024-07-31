//
//  LoadingAnimationView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 31/7/24.
//

import SwiftUI

struct LoadingAnimationView: View {
    @State private var moveRightLeft: Bool = false
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack(alignment: .leading) {
                    Capsule()
                        .frame(width: 200, height: 6)
                        .foregroundColor(Color(.systemGray4))
                    
                    Capsule()
                        .frame(width: 100, height: 6)
                        .foregroundColor(Color(.systemBlue))
                        .offset(x: moveRightLeft ? 100 : 0, y: 0)
                        .animation(
                            Animation.easeInOut(duration: 0.5)
                                .repeatForever(autoreverses: true),
                            value: moveRightLeft
                        )
                        .onAppear {
                            moveRightLeft.toggle()
                        }
                }
                Text("Loading...")
                    .foregroundColor(.white)
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    LoadingAnimationView()
}
