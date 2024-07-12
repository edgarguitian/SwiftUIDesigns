//
//  Inspector View.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 12/7/24.
//

import SwiftUI

struct Inspector_View: View {
    @State private var isShowingInspector = false

        var body: some View {
            Button("Show Inspector") {
                isShowingInspector.toggle()
            }
            .buttonStyle(.bordered)
            .font(.largeTitle)
            .inspector(isPresented: $isShowingInspector) {
                Text("Inspector View")
                    .inspectorColumnWidth(min: 50, ideal: 150, max: 200)
            }
        }
}

#Preview {
    Inspector_View()
}
