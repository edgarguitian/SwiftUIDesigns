//
//  DatePickerTimeView.swift
//  SwiftUIDesigns
//
//  Created by Edgar Guitian Rey on 14/12/23.
//

import SwiftUI

struct DatePickerTimeView: View {
    @State var currentDate: Date = Date()
    
    var body: some View {
        Form {
            DatePicker("Select Date", selection: $currentDate)
        }
    }
}

#Preview {
    DatePickerTimeView()
}
