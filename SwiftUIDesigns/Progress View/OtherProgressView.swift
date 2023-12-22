//
//  OtherProgressView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct OtherProgressView: View {
    let workoutDateRange = Date()...Date().addingTimeInterval(10)
    
    var body: some View {
        NavigationStack {
            ProgressView(timerInterval: workoutDateRange) {
                Text("Workout")
            }
            .padding()
            .navigationTitle("Progress View")
            Spacer()
        }
    }
}

#Preview {
    OtherProgressView()
}
