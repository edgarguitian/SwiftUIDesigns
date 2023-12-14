//
//  DatePickerView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct DatePickerView: View {
    @State var currentDate: Date = Date()
    
    var body: some View {
        Text(currentDate, style: .date)
            .font(.largeTitle)
            .bold()
        Form {
            DatePicker("Select Future Date",
                       selection: $currentDate,
                       in: Date()...,
                       displayedComponents: .date)
        }
    }
}

#Preview {
    DatePickerView()
}
