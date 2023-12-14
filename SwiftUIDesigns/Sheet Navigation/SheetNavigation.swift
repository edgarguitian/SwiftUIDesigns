//
//  SheetNavigation.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct SheetNavigation: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            ZStack {
                Color.purple
                VStack {
                    Text("👋 Hello!")
                        .bold()
                        .font(.system(size: 60))
                        .foregroundStyle(.white)
                    Button {
                        dismiss()
                    } label: {
                        Text("Dismiss Button")
                            .bold()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.white)
                    .foregroundStyle(.blue)
                    Spacer()
                }
                .padding(.top, 80)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SheetNavigation()
}
