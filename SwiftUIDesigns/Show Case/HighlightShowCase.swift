//
//  HighlightShowCase.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 31/7/24.
//

import SwiftUI

struct HighlightShowCase: Identifiable, Equatable {
    var id: UUID = .init()
    var anchor: Anchor<CGRect>
    var title: String
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle = .continuous
    var scale: CGFloat = 1
}
