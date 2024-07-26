//
//  CarouselImage.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 26/7/24.
//

import Foundation

struct ImageModel: Identifiable {
    var id: UUID = .init()
    var image: String
}

var images: [ImageModel] = (1...3).compactMap({ ImageModel(image: "Profile \($0)") })
