//
//  ContextMenuView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct ContextMenuView: View {
    var body: some View {
        NavigationStack {
            Text("SwiftUIDesigns Menu")
                .font(.largeTitle)
                .padding()
                .underline()
                .contextMenu(
                    ContextMenu(menuItems: {
                        Button(action: {
                            print("Calendar")
                        }, label: {
                            Label("Calendar",
                                  systemImage: "calendar.badge.plus")
                        })
                        
                        Button(action: {
                            print("Folder")
                        }, label: {
                            Label("Folder",
                                  systemImage: "folder.fill")
                        })
                        
                        Button(action: {
                            print("Phone")
                        }, label: {
                            Label("Phone",
                                  systemImage: "iphone")
                        })
                    })
                )
            Spacer()
                .navigationTitle("ContextMenu")
        }
    }
}

#Preview {
    ContextMenuView()
}
