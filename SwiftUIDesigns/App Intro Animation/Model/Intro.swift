//
//  Intro.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 31/7/24.
//

import SwiftUI

struct Intro: Identifiable {
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
}

var intros: [Intro] = [
    .init(imageName: "Profile 1", title: "Relax"),
    .init(imageName: "Profile 2", title: "Care"),
    .init(imageName: "Profile 3", title: "Mood Dairy")
]

let dummyTextIntro = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum is dummy text."
