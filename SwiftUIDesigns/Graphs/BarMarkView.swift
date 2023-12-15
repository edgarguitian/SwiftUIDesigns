//
//  BarMarkView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import SwiftUI
import Charts

var data: [PetDataSeries] {
    [PetDataSeries(type: "cat", petData: catData),
     PetDataSeries(type: "dog", petData: dogData)]
}
let catData: [PetData] = [PetData(year: 2000, population: 6.8),
                          PetData(year: 2010, population: 8.2),
                          PetData(year: 2015, population: 12.9),
                          PetData(year: 2022, population: 15.2)]
let dogData: [PetData] = [PetData(year: 2000, population: 5),
                          PetData(year: 2010, population: 5.3),
                          PetData(year: 2015, population: 7.9),
                          PetData(year: 2022, population: 10.6)]

struct BarMarkView: View {
    var body: some View {
        Chart {
            BarMark(x: .value("Type", "bird"),
                    y: .value("Population", 1))
            .foregroundStyle(.pink)
            
            BarMark(x: .value("Type", "dog"),
                    y: .value("Population", 2))
            .foregroundStyle(.green)
            
            BarMark(x: .value("Type", "cat"),
                    y: .value("Population", 3))
            .foregroundStyle(.blue)
        }
        .aspectRatio(1, contentMode: .fit)
        .padding()
        
        
    }
}

#Preview {
    BarMarkView()
}
