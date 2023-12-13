//
//  Tap.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 13/12/23.
//

import Foundation
import SwiftUI

struct TapItems: Identifiable {
    var id = UUID()
    var icon: String
    var tap: Tap
}
var tapItems = [
    TapItems(icon: "house", tap: .home),
    TapItems(icon: "magnifyingglass", tap: .maginf),
    TapItems(icon: "bell", tap: .bell),
    TapItems(icon: "rectangle.stack", tap: .rect)
]
enum Tap: String {
    case home
    case maginf
    case bell
    case rect
}

struct TabBarT: View {
    @State var selectedTap: Tap = .home
    var body: some View {
        HStack {
            ForEach(tapItems) { item in
                Button {
                    withAnimation {
                        selectedTap = item.tap
                    }
                } label: {
                    VStack(spacing: 0) {
                        Image(systemName: item.icon)
                            .symbolVariant(.fill)
                            .font(.body.bold())
                            .frame(width: 30, height: 30)
                    }
                    .frame(maxWidth: .infinity)
                }
                .foregroundStyle(selectedTap == item.tap ? .primary : .secondary)
            }
        }
        .frame(width: 350, height: 90)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("3d5"), .white]), startPoint: .top, endPoint: .bottomTrailing)
                    )
                    .blur(radius: 10)
                    .offset(x: -10, y: -10)
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("3d5"), .white]), startPoint: .top, endPoint: .bottom)
                    )
                    .padding(2)
                    .blur(radius: 1)
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .stroke(lineWidth: 0.1)
                    .blur(radius: 1)
            }
        )
        .overlay(content: {
            HStack {
                if selectedTap == .maginf { Spacer() }
                if selectedTap == .rect { Spacer() }
                if selectedTap == .bell {
                    Spacer()
                    Spacer()
                }
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(.primary)
                    .frame(width: 65)
                    .frame(maxHeight: 50, alignment: .bottom)
                if selectedTap == .home { Spacer() }
                if selectedTap == .maginf {
                    Spacer()
                    Spacer()
                }
                if selectedTap == .bell { Spacer() }


            }
            .padding(.horizontal, 8)
        })
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: .black.opacity(0.2), radius: 20, x: 50, y: 30)
    }
}

struct TabBarT_Previews: PreviewProvider {
    static var previews: some View {
        TabBarT()
    }
}
