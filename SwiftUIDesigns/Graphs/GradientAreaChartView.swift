//
//  GradientAreaChartView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import SwiftUI
import Charts

struct GradientAreaChartView: View {
    let catData = PetData.catExample
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4),
                                                                    Color.accentColor.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
    var body: some View {
        Chart {
            ForEach(catData) { data in
                LineMark(x: .value("Year", data.year),
                         y: .value("Population", data.population))
            }
            .interpolationMethod(.cardinal)
            .symbol(by: .value("Pet type", "cat"))

            ForEach(catData) { data in
                AreaMark(x: .value("Year", data.year),
                         y: .value("Population", data.population))
            }
            .interpolationMethod(.cardinal)
            .foregroundStyle(linearGradient)
        }
        .chartXScale(domain: 1998...2024)
        .chartLegend(.hidden)
        .chartXAxis {
            AxisMarks(values: [2000, 2010, 2015, 2022]) { value in
                AxisGridLine()
                AxisTick()
                if let year = value.as(Int.self) {
                    AxisValueLabel(formatte(number: year),
                                   centered: false,
                                   anchor: .top)
                }
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
    
    func formatte(number: Int) -> String {
            let numberFormatter = NumberFormatter()
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.maximumFractionDigits = 0
            return numberFormatter.string(from: NSNumber(value: number)) ?? ""
        }
}

#Preview {
    GradientAreaChartView()
}
