//
//  HeatMapView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import SwiftUI
import Charts

struct HeatMapView: View {
    let heatData: [HeatData] = HeatData.exampleData

    var body: some View {
        Chart(heatData) {
            RectangleMark(xStart: .value("start location x", $0.locationX - 25),
                          xEnd: .value("end location x", $0.locationX + 25),
                          yStart: .value("start location y", $0.locationY - 25),
                          yEnd: .value("end location y", $0.locationY + 25))
            .foregroundStyle(by: .value("Number", $0.temperatur))
        }
        .chartXScale(domain: 25...225)
        .chartYScale(domain: 25...225)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    HeatMapView()
}
