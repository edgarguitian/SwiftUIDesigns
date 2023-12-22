//
//  ThumbnailView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 22/12/23.
//

import SwiftUI

struct ThumbnailView: View {
    var id = UUID()
    @ViewBuilder var content: any View
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}
