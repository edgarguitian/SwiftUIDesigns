//
//  SymbolEffectsView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import SwiftUI

struct SymbolEffectsView: View {
    var body: some View {
        ScrollView {
            
            Image(systemName: "rainbow")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)

            Image(systemName: "rainbow")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .symbolEffect(.variableColor)
            
            Image(systemName: "rainbow")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .symbolEffect(
                    .variableColor
                        .reversing
                )
            
            Image(systemName: "rainbow")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .symbolEffect(
                    .variableColor
                        .iterative
                )
            
            Image(systemName: "rainbow")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .symbolEffect(
                    .variableColor
                        .iterative
                        .reversing
                )
            
            Image(systemName: "rainbow")
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .symbolEffect(
                    .variableColor
                        .iterative
                        .reversing
                        .hideInactiveLayers
                )
        }
        .scrollIndicators(.visible)
    }
}

#Preview {
    SymbolEffectsView()
}
