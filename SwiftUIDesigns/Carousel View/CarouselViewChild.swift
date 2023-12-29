//
//  CarouselViewChild.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 29/12/23.
//

import SwiftUI

struct CarouselViewChild: View, Identifiable {
    var id: Int
    @ViewBuilder var content: any View
    var body: some View {
        ZStack {
            AnyView(content)
        }
    }
}
