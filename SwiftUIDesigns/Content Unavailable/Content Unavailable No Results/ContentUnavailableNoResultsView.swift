//
//  ContentUnavailableNoResultsView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ContentUnavailableNoResultsView: View {
    var body: some View {
        ContentUnavailableView.search
                    .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentUnavailableNoResultsView()
}
