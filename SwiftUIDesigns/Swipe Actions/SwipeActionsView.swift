//
//  SwipeActionsView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 12/7/24.
//

import SwiftUI

struct SwipeActionsView: View {
    let friends = ["Antoine", "Bas", "Curt", "Dave", "Erica"]

    var body: some View {
        VStack {
            Text("Desliza un elemento para eliminarlo")
            List {
                ForEach(friends, id: \.self) { friend in
                    Text(friend)
                        .swipeActions(edge: .trailing) {
                            Button(role: .destructive) {
                                print("Deleting conversation")
                            } label: {
                                Label("Delete", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                }
                
            }
        }
    }
}

#Preview {
    SwipeActionsView()
}
