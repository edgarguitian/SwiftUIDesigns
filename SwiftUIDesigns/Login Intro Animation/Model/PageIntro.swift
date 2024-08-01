//
//  PageIntro.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 1/8/24.
//

import SwiftUI

struct PageIntro: Identifiable, Hashable {
    var id: UUID = .init()
    var introAssetImage: String
    var title: String
    var subTitle: String
    var displaysAction: Bool = false
}

var pageIntros: [PageIntro] = [
    .init(introAssetImage: "Profile 1", title: "Connect With\nCreators Easily", subTitle: "Thank you for choosing us, we can save your lovely time."),
    .init(introAssetImage: "Profile 2", title: "Get Inspiration\nFrom Creators", subTitle: "Find your favourite creator and get inspired by them."),
    .init(introAssetImage: "Profile 3", title: "Let's\nGet Started", subTitle: "To register for an account, kindly enter your details", displaysAction: true)
]
