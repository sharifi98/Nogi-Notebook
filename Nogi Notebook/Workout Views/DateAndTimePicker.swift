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
    
    @Binding var selectedStartDateAndTime: Date
    @Binding var selectedEndDateAndTime: Date
    
    var body: some View {
            DatePicker("Start", selection: $selectedStartDateAndTime)
            DatePicker("End", selection: $selectedEndDateAndTime)
        
    }
}

struct DateAndTimePicker_Previews: PreviewProvider {
    @State static var previewDate = Date()
    @State static var previewTime = Date()
    
    static var previews: some View {
        DateAndTimePicker(selectedStartDateAndTime: $previewDate, selectedEndDateAndTime: $previewTime)
    }
}

