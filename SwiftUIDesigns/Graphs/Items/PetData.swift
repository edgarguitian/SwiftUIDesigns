//
//  PetData.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import Foundation

struct PetData: Identifiable, Equatable {
    let year: Int
    let population: Double

    var id: Int { return year }
}

extension PetData {
    // Ejemplo de datos para gatos
    static let catExample: [PetData] = [
        PetData(year: 2000, population: 6.8),
        PetData(year: 2010, population: 8.2),
        PetData(year: 2015, population: 12.9),
        PetData(year: 2022, population: 15.2)
    ]

    // Ejemplo de datos para perros
    static let dogExamples: [PetData] = [
        PetData(year: 2000, population: 5),
        PetData(year: 2010, population: 5.3),
        PetData(year: 2015, population: 7.9),
        PetData(year: 2022, population: 10.6)
    ]
}
