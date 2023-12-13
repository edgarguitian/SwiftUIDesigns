//
//  ContentViewCell.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 13/12/23.
//

import SwiftUI

struct ContentViewCell: View {
    let title: String
    var body: some View {
        Text(title)
    }
}

#Preview {
    ContentViewCell(title: "Test")
}
