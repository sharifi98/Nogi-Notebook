//
//  StartTimePickerView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 26/10/2023.
//

import SwiftUI

struct StartTimePickerView: View {
    @Binding var selectedDate: Date
    var body: some View {
        DatePicker("", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
            .datePickerStyle(WheelDatePickerStyle())
            .padding()
    }
}

/*
 
 #Preview {
 StartTimePickerView(selectedDate: <#Binding<Date>#>)
 }
 */
 
