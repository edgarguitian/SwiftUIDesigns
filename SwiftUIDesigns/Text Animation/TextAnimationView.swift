//
//  TextAnimationView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct TextAnimationView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to SwiftUI Views 🎉")
                .font(isActive ? .system(size: 60, weight: .bold) : .system(size: 40))
                .foregroundStyle(isActive ? .black : .blue)
                .padding(isActive ? 20 : 0)
                .background(isActive ? .orange : .clear)
                .cornerRadius(isActive ? 20 : 0)
                .onTapGesture { withAnimation { isActive.toggle() } }
            Spacer()
        }
        .padding()
        .padding(.top, 40)
    }
}

#Preview {
    TextAnimationView()
}
