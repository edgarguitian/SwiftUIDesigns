//
//  ExpandedView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 22/12/23.
//

import SwiftUI

struct ExpandedView: View {
    var id = UUID()
    @ViewBuilder var content: any View
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}
