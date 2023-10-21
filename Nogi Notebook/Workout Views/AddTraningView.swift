//
//  AddTraningView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI






struct AddTraningView: View {
    
    // array of random work
    
    
    @EnvironmentObject var workoutStore: WorkoutStore
    
    
    private let roundsRange = 1...20
    private let roundLengthRange = 1...8
    
    private var df: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d MMM, HH:mm"  // Military time using HH:mm
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }

    
    @Environment(\.dismiss) var dismiss
    @Binding var showAddTraningView: Bool
    
    var workoutType = ["Gi", "NoGi"]
    @State var selectedWorkoutName = "Gi"
    
    @State private var name = ""
    @State private var notes = ""
    @State private var startTime = Date()
    @State private var endTime = Date()
    @State private var submissions = 0
    @State private var taps = 0
    @State private var sweeps = 0
    @State private var takedowns = 0
    @State private var rounds: Int = 1
    @State private var roundLength: Int = 5

    // MARK: - Computed Properties
    private var workoutSummary: Int {
        return rounds * roundLength
    }
    
    var body: some View {
        NavigationStack {
            List {
                nameSection
                headerSection
                notesSection
                statsSection
                roundsSection
                roundLengthSection
            }
            .toolbar {
                topBarButtons
            }
            
            // summarySection
        }
    }
    
    
    
    // MARK: - Subviews
    
    private var nameSection: some View{
        VStack {
            Picker("Select workoutname", selection: $selectedWorkoutName) {
                ForEach(workoutType, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
        }
        
        
    }
    
    private var notesSection: some View {
        TextField("Notes", text: $notes)
    }
    
    private var headerSection: some View {
        DateAndTimePicker(selectedDate: $startTime, selectedTime: $endTime)
    }

    
    private var statsSection: some View {
        Section {
            statStepper(title: "Submissions", value: $submissions)
            statStepper(title: "Taps", value: $taps)
            statStepper(title: "Sweeps", value: $sweeps)
            statStepper(title: "Takedowns", value: $takedowns)
        }
    }
    
    private var roundsSection: some View {
        Section {
            Text("Rounds rolled")
            Picker("Rounds rolled", selection: $rounds) {
                ForEach(roundsRange, id: \.self) { number in
                    Text("\(number)").tag(number)
                        .rotationEffect(Angle(degrees: 90))

                    
                }
            }
            .rotationEffect(Angle(degrees: -90))
            .pickerStyle(.wheel)
            .frame(height: 150)
        }
    }
    
    private var roundLengthSection: some View {
        Section {
            Text("Round length (Minutes)")
            Picker("Round length", selection: $roundLength) {
                ForEach(roundLengthRange, id: \.self) { number in
                    Text("\(number)").tag(number)
                }
            }
            .pickerStyle(.palette)
        }
        .padding(.bottom)
    }
    
    private var summarySection: some View {
        VStack {
            Text("Total roll time")
                .font(.title3)
            Text("\(workoutSummary) minutes")
                .font(.title)
        }
        .multilineTextAlignment(.center)
    }
    
    private var topBarButtons: some ToolbarContent {
        Group {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    let newWorkout = Workout(name: selectedWorkoutName, 
                                             notes: notes,
                                             startTime: startTime,
                                             endTime: endTime,
                                             submissions:   submissions,
                                             taps: taps,
                                             sweeps: sweeps,
                                             takedowns: takedowns,
                                             rounds: rounds,
                                             roundLength: roundLength)
                    
                    workoutStore.add(workout: newWorkout)
                    dismiss()
                } label: {
                    Text("Save")
                        .foregroundStyle(.cyan)
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(.cyan)
                }
            }
        }
    }

    
    private func statStepper(title: String, value: Binding<Int>) -> some View {
        HStack {
            Stepper(title, value: value, in: 0...100)
            Text("\(value.wrappedValue)")
        }
    }
}

struct AddTraningView_Previews: PreviewProvider {
    static var previews: some View {
        AddTraningView(showAddTraningView: .constant(true))
            .environmentObject(WorkoutStore())
    }
}
