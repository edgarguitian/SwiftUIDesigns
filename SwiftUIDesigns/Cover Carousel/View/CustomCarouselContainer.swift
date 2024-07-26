//
//  CustomCarouselContainer.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 26/7/24.
//

import SwiftUI

struct CustomCarouselContainer: View {
    @State private var activeID: UUID?
    var body: some View {
        NavigationStack {
            VStack {
                CustomCarousel(config: .init(hasOpacity: true, hasScale: true, cardWidth: 200, minimumCardWidth: 30), selection: $activeID, data: images) { item in
                    Image(item.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(height: 180)
            }
            .navigationTitle("Cover Carousel")
        }
    }
}

#Preview {
    CustomCarouselContainer()
}
