//
//  HeatData.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import Foundation

struct HeatData: Identifiable {
    let locationX: Int
    let locationY: Int
    let temperatur: Double
    let id = UUID()

    static var exampleData: [HeatData] {
        [HeatData(locationX: 50, locationY: 50, temperatur: 23.0),
         HeatData(locationX: 50, locationY: 100, temperatur: 15.0),
         HeatData(locationX: 50, locationY: 150, temperatur: 25.0),
         HeatData(locationX: 50, locationY: 200, temperatur: 22.5),

         HeatData(locationX: 100, locationY: 50, temperatur: 20.0),
         HeatData(locationX: 100, locationY: 100, temperatur: 26.5),
         HeatData(locationX: 100, locationY: 150, temperatur: 29.4),
         HeatData(locationX: 100, locationY: 200, temperatur: 17.0),

         HeatData(locationX: 150, locationY: 50, temperatur: 24.0),
         HeatData(locationX: 150, locationY: 100, temperatur: 23.5),
         HeatData(locationX: 150, locationY: 150, temperatur: 21.5),
         HeatData(locationX: 150, locationY: 200, temperatur: 15.0),

         HeatData(locationX: 200, locationY: 50, temperatur: 10.0),
         HeatData(locationX: 200, locationY: 100, temperatur: 26.5),
         HeatData(locationX: 200, locationY: 150, temperatur: 27.0),
         HeatData(locationX: 200, locationY: 200, temperatur: 17.0)
        ]
    }
}
