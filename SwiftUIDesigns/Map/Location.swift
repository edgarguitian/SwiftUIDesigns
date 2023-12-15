//
//  Location.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 15/12/23.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
