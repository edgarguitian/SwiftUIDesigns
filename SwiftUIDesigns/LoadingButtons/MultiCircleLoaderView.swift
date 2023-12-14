//
//  MultiCircleLoaderView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI


struct MultiCircleLoaderView: View {
    var body: some View {
        ZStack {
            RotateCircleAroundCircle(timeInterval: 0.03, size: 120)
            RotateCircleAroundCircle(timeInterval: 0.05, size: 90)
            RotateCircleAroundCircle(timeInterval: 0.07, size: 60)
        }
    }
}

#Preview {
    MultiCircleLoaderView()
}
