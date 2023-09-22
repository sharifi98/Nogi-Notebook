//
//  AddTraningView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

struct AddTraningView: View {
    
    @State var submissions = 0
    @State var taps = 0
    @State var sweeps = 0
    @State var takedowns = 0
    
    @State var rounds: Int = 0
    @State var roundLength: Int = 5
    
    let date = Date()
    
    let df: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }()
    
    @State var workoutName = ""
    
    var body: some View {
        List {
            Text(df.string(from: date))
            TextField("Name", text: $workoutName)
            
            Section {
                HStack {
                    Stepper("Submissions", value: $submissions, in: 0...100)
                    Text("\(submissions)")
                }
                HStack {
                    Stepper("Taps", value: $taps, in: 0...100)
                    Text("\(taps)")
                }
                HStack {
                    Stepper("Sweeps", value: $sweeps, in: 0...100)
                    Text("\(sweeps)")
                }
            }
            
            Section {
                VStack {
                    Text("Rounds rolled")
                    Picker("Rounds rolled", selection: $rounds) {
                        ForEach(1...12, id: \.self) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    .pickerStyle(.palette)
                }
            }
            
            Section {
                VStack {
                    Text("Round length")
                    Picker("Round length", selection: $roundLength) {
                        ForEach(1...8, id: \.self) { number in
                            Text("\(number)").tag(number)
                        }
                    }
                    .pickerStyle(.palette)
                }
            }
            
            
            
            
        }
    }
}
#Preview {
    AddTraningView()
}
