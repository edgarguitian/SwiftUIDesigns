//
//  TripCard.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 1/8/24.
//

import SwiftUI

struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var image: String
}

var tripCards: [TripCard] = [
    .init(title: "Test 1", subTitle: "Desc 1", image: "Profile 1"),
    .init(title: "Test 2", subTitle: "Desc 2", image: "Profile 2"),
    .init(title: "Test 3", subTitle: "Desc 3", image: "Profile 3")
]
