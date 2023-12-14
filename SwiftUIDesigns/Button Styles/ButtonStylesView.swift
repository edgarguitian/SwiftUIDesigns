//
//  ButtonStylesView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ButtonStylesView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Button("SwiftUIDesigns Bordered") {
                    print("SwiftUI Views")
                }
                .buttonStyle(.bordered)
                
                Button("SwiftUIDesigns Bordered Prominent") {
                    print("SwiftUI Views")
                }
                .buttonStyle(.borderedProminent)
                
                Button("SwiftUIDesigns Borderless") {
                    print("SwiftUI Views")
                }
                .buttonStyle(.borderless)
                
                Button("SwiftUIDesigns Plain") {
                    print("SwiftUI Views")
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 32)
            .navigationTitle("Button Styles")
            Spacer()
        }
    }
}

#Preview {
    ButtonStylesView()
}
