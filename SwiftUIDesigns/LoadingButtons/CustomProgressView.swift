//
//  CustomProgressView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct CustomProgressView: View {
  let progress: CGFloat

  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .frame(width: geometry.size.width, height: 10)
          .opacity(0.3)
          .foregroundColor(.gray)

        Rectangle()
          .frame(
            width: min(progress * geometry.size.width,
                       geometry.size.width),
            height: 10
          )
          .foregroundColor(.blue)
      }
    }
  }
}
