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

struct FinishedWorkoutView: View {
    // MARK: - Properties
    let formatter: DateFormatter
    @State var workout: Workout
    @State private var subs: String
    @State private var taps: String
    @State private var take: String
    @State private var swps: String
    @State private var showingStartTimePicker = false
    @State private var showingEndTimePicker = false
    
    // MARK: - Initializers
    public init(workout: Workout) {
        self._workout = State(initialValue: workout)
        self._subs = State(initialValue: workout.submissions > 0 ? "\(workout.submissions)" : "0")
        self._taps = State(initialValue: workout.taps > 0 ? "\(workout.taps)" : "0")
        self._take = State(initialValue: workout.takedowns > 0 ? "\(workout.takedowns)" : "0")
        self._swps = State(initialValue: workout.sweeps > 0 ? "\(workout.sweeps)" : "0")
        
        self.formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d 'at' HH:mm"
    }
    
    // MARK: - Body
    var body: some View {
        List {
            workoutDetailsSection
            totalRoundsSection
            statisticsSection
        }
        .navigationTitle("\(workout.name)")
        .listRowBackground(Color.white)
    }
    
    private var workoutDetailsSection: some View {
        Section {
            Text("\(workout.name)").bold()
            timeSelectionRow(title: "Start Time", showingPicker: $showingStartTimePicker, time: $workout.startTime)
            timeSelectionRow(title: "End Time", showingPicker: $showingEndTimePicker, time: $workout.endTime)
            Text("Bodyweight")
            HStack {
                Text("Notes")
                Text(workout.notes)
            }
        }
    }
    
    private var totalRoundsSection: some View {
        Section(header: Text("Total rounds")) {
            Text("\(workout.rounds)")
                .foregroundStyle(.black)
        }
        .listRowBackground(Color.white)
    }
    
    private var statisticsSection: some View {
        Section(header: Text("Statistics")) {
            StatSection(title: "SUB", stringValue: $subs) { workout.submissions = $0 }
            StatSection(title: "TAP", stringValue: $taps) { workout.taps = $0 }
            StatSection(title: "SWP", stringValue: $swps) { workout.sweeps = $0 }
            StatSection(title: "TKD", stringValue: $take) { workout.takedowns = $0 }
        }
        .listRowBackground(Color.white)
    }
    
    private func timeSelectionRow(title: String, showingPicker: Binding<Bool>, time: Binding<Date>) -> some View {
        HStack {
            Text(title)
            Spacer()
            Button(action: {
                showingPicker.wrappedValue = true
            }) {
                Text(formatter.string(from: time.wrappedValue))
                    .foregroundColor(.blue)
            }
            .sheet(isPresented: showingPicker) {
                StartTimePickerView(selectedDate: time)
            }
        }
    }
}

// MARK: - StatSection
struct StatSection: View {
    @FocusState private var isKeyboardFocused: Bool
    let title: String
    @Binding var stringValue: String
    var updateValue: (Int) -> Void
    
    private var intValue: Int { Int(stringValue) ?? 0 }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(title).foregroundStyle(.black)
                
                TextField("", text: $stringValue, onCommit: {
                    if let newValue = Int(stringValue) {
                        updateValue(newValue)
                    }
                })
                .foregroundStyle(.black)
                .focused($isKeyboardFocused)
                .keyboardType(.numberPad)
                .toolbar {
                    if isKeyboardFocused {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") { isKeyboardFocused = false }
                        }
                    }
                }
                
                Stepper(value: Binding(get: { self.intValue }, set: { newValue in
                    stringValue = "\(newValue)"
                    updateValue(newValue)
                }), in: 0...50) {
                    Text("\(intValue)")
                }
                
                Button(action: {}) {
                    Image(systemName: "chart.bar.xaxis").foregroundStyle(.blue)
                }
                
                Button(action: {}) {
                    Image(systemName: "star.fill").foregroundStyle(.blue)
                }
            }
        }
        
    }
}

// MARK: - Previews
struct WorkoutView2_Previews: PreviewProvider {
    static var previews: some View {
        FinishedWorkoutView(workout: sampleWorkout)
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
