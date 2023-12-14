//
//  RadialGradientView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct RadialGradientView: View {
    let gradient = Gradient(colors: [Color(red: 40/255.0,
                                           green: 120/255.0,
                                           blue: 200/255.0), .black])
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: gradient,
                           center: .center,
                           startRadius: 0,
                           endRadius: 360)
            .ignoresSafeArea()
            
            VStack {
                Text("SwiftUI\nDesigns")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 80, weight: .bold, design: .monospaced))
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    RadialGradientView()
}
