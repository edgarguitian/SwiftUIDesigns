//
//  DatePickerWithTimeView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct DatePickerWithTimeView: View {
    @State var currentDate: Date = Date()
    
    var body: some View {
        Form {
            Section("Select Date") {
                DatePicker("Select Date", selection: $currentDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
            }
        }
    }
}

#Preview {
    DatePickerWithTimeView()
}
