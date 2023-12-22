//
//  ChartData.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import Foundation

struct ChartData: Identifiable, Equatable {
    let type: String
    let count: Int

    var id: String { return type }
}
