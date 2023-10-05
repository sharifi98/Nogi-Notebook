//
//  DateAndTimePicker.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 05/10/2023.
//

import SwiftUI

struct DateAndTimePicker: View {
    enum PickerMode {
        case date, time
    }
    
    @Binding var selectedDate: Date
    @Binding var selectedTime: Date
    @State private var mode: PickerMode = .date

    var body: some View {
        VStack(spacing: 20) {
            Picker("Select Mode", selection: $mode) {
                Text("Date").tag(PickerMode.date)
                Text("Time").tag(PickerMode.time)
            }
            .pickerStyle(SegmentedPickerStyle())

            if mode == .date {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .environment(\.locale, Locale(identifier: "en_GB"))
            } else {
                DatePicker("Select Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .environment(\.locale, Locale(identifier: "en_GB"))
            }
        }
    }
}

struct DateAndTimePicker_Previews: PreviewProvider {
    @State static var previewDate = Date()
    @State static var previewTime = Date()

    static var previews: some View {
        DateAndTimePicker(selectedDate: $previewDate, selectedTime: $previewTime)
    }
}

