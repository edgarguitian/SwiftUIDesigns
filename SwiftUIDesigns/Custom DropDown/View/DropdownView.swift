//
//  DropdownView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/7/24.
//

import SwiftUI

var pickerValues: [String] = ["YouTube", "Instagram", "X (Twitter)", "Snapchat", "TikTok"]
struct DropdownView: View {
    @State private var config: DropdownConfig = .init(activeText: "YouTube")
    var body: some View {
        NavigationStack {
            List {
                SourceDropdownView(config: $config)
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
            .navigationTitle("Dropdown")
        }
        .dropdownOverlay($config, values: pickerValues)
    }
}

#Preview {
    DropdownView()
}
