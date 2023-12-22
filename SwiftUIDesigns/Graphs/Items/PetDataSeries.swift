//
//  PetDataSeries.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import Foundation

struct PetDataSeries: Identifiable {
    let type: String
    let petData: [PetData]
    var id: String { type }
}
