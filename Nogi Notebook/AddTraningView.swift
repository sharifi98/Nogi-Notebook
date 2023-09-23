//
//  AddTraningView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

struct AddTraningView: View {
    
    @EnvironmentObject var workoutStore: WorkoutStore
    
    
    private let roundsRange = 1...20
    private let roundLengthRange = 1...8
    
    private let df: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }()
    
    @Environment(\.dismiss) var dismiss
    @Binding var showAddTraningView: Bool
    
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
                headerSection
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
    private var headerSection: some View {
        VStack {
            Text(df.string(from: Date()))
        }
    }
    
    private var statsSection: some View {
        Section {
            statStepper(title: "Submissions", value: $submissions)
            statStepper(title: "Taps", value: $taps)
            statStepper(title: "Sweeps", value: $sweeps)
        }
    }
    
    private var roundsSection: some View {
        Section {
            Text("Rounds rolled")
            Picker("Rounds rolled", selection: $rounds) {
                ForEach(roundsRange, id: \.self) { number in
                    Text("\(number)").tag(number)
                }
            }
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
                Button("Save") {
                    let newWorkout = Workout(date: Date(),
                                             submissions: submissions,
                                             taps: taps,
                                             sweeps: sweeps,
                                             rounds: rounds,
                                             roundLength: roundLength)
                    
                    workoutStore.add(workout: newWorkout)
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
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
