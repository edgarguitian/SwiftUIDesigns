//
//  GridView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Color.clear
                        .gridCellUnsizedAxes([.horizontal, .vertical])
                    ForEach(1..<4) { column in
                        Text("Column \(column)")
                    }
                }
                ForEach(1..<4) { row in
                    GridRow {
                        Text("Row \(row)")
                        ForEach(1..<4) { _ in
                            Circle().foregroundStyle(.blue.gradient)
                        }
                    }
                }
            }
            .padding(.top, 40)
            Spacer()
        }
    }
}

#Preview {
    GridView()
}
