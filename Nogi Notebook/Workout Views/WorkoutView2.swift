//
//  WorkoutView2.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 25/10/2023.
//

//
//  WorkoutView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 17/10/2023.
//

import SwiftUI

struct WorkoutView2: View {
    let formatter: DateFormatter
    
    @State private var showingStartTimePicker = false
    @State private var showingEndTimePicker = false
    
    @State var workout: Workout
    @State private var subs: String
    @State private var taps: String
    @State private var take: String
    @State private var swps: String
    
    
    public init(workout: Workout) {
        self._workout = State(initialValue: workout)
        self._subs = State(initialValue: workout.submissions > 0 ? "\(workout.submissions)" : "0")
        self._taps = State(initialValue: workout.taps > 0 ? "\(workout.taps)" : "0")
        self._take = State(initialValue: workout.takedowns > 0 ? "\(workout.takedowns)" : "0")
        self._swps = State(initialValue: workout.sweeps > 0 ? "\(workout.sweeps)" : "0")
        
        self.formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d 'at' HH:mm"
    }
    
    var body: some View {
        List {
            Section {
                Text("\(workout.name)")
                    .bold()
                
                HStack {
                    Text("Start Time")
                    Spacer()
                    Button(action: {
                        showingStartTimePicker = true
                    }) {
                        Text(formatter.string(from: workout.startTime))
                            .foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showingStartTimePicker) {
                        StartTimePickerView(selectedDate: $workout.startTime)
                            .presentationDetents([.fraction(0.4)])
                    }
                }
                
                HStack {
                    Text("End Time")
                    Spacer()
                    Button(action: {
                        showingEndTimePicker = true
                    }) {
                        Text(formatter.string(from: workout.endTime))
                            .foregroundColor(.blue)
                    }
                    .sheet(isPresented: $showingEndTimePicker) {
                        StartTimePickerView(selectedDate: $workout.endTime)
                    }
                }
                
                
                
                HStack {
                    Text("Bodyweight")
                }
                
                HStack {
                    Text("Notes")
                    Text(workout.notes)
                }
            }
            
            Section(header: Text("Total rounds")) {
                
                Text("\(workout.rounds)")
            }
            Section(header: Text("Statistics")){
                
                StatSection(title: "SUB", stringValue: $subs) { value in
                    workout.submissions = value
                }
                
                StatSection(title: "TAP", stringValue: $taps) { value in
                    workout.taps = value
                }
                
                StatSection(title: "SWP", stringValue: $swps) { value in
                    workout.sweeps = value
                }
                
                StatSection(title: "TKD", stringValue: $take) { value in
                    workout.takedowns = value
                }
            }
        }
        .navigationTitle("\(workout.startTime)")
    }
}

struct WorkoutView2_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView2(workout: sampleWorkout)
            .padding()
            .previewLayout(.sizeThatFits)
    }
    
    static let sampleWorkout = Workout(
        name: "NoGi",
        notes: "",
        startTime: Date(),
        endTime: Date(),
        submissions: 3,
        taps: 2,
        sweeps: 4,
        takedowns: 3,
        rounds: 5,
        roundLength: 6
    )
}



struct StatSection: View {
    @FocusState private var isKeyboardFocused: Bool
    let title: String
    @Binding var stringValue: String
    var updateValue: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title)
                TextField("", text: $stringValue, onCommit: {
                    if let newValue = Int(stringValue) {
                        updateValue(newValue)
                    }
                })
                .focused($isKeyboardFocused)
                .keyboardType(.numberPad)
                .toolbar {
                    // Show the Done button only when this specific TextField is focused
                    if isKeyboardFocused {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") {
                                isKeyboardFocused = false
                            }
                        }
                    }
                }
                Button(action: {}) {
                    Image(systemName: "chart.bar.xaxis")
                        .foregroundStyle(.blue)
                }
                
                Button(action: {}) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}


