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
    
    @State var workout: Workout
    let formatter: DateFormatter
    @State private var subs: String
    @State private var taps: String
    @State private var take: String
    @State private var swps: String
    
    
    public init(workout: Workout) {
        self._workout = State(initialValue: workout)
        self._subs = State(initialValue: "\(workout.submissions)")
        self._taps = State(initialValue: "\(workout.taps)")
        self._take = State(initialValue: "\(workout.takedowns)")
        self._swps = State(initialValue: "\(workout.sweeps)")
        
        self.formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d 'at' HH:mm"
    }
    
    var body: some View {
        List {
            Section {
                Text("\(workout.name)")
                    .bold()
                
                HStack {
                    NavigationLink(destination: Text("Hello")) {
                        Text("Start Time")
                        Spacer()
                        Text(formatter.string(from: workout.startTime))
                    }
                }
                
                HStack {
                    NavigationLink(destination: Text("Change endtime")){
                        Text("End Time")
                        Spacer()
                        Text(formatter.string(from: workout.endTime))
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
            
            StatSection(title: "Submissions", stringValue: $subs) { value in
                workout.submissions = value
            }
            
            StatSection(title: "Taps", stringValue: $taps) { value in
                workout.taps = value
            }
            
            StatSection(title: "Sweeps", stringValue: $swps) { value in
                workout.sweeps = value
            }
            
            StatSection(title: "TKD", stringValue: $take) { value in
                workout.takedowns = value
            }
        }
        .navigationTitle("Date")
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
    let title: String
    @Binding var stringValue: String
    var updateValue: (Int) -> Void
    
    var body: some View {
        Section {
            Text(title)
            VStack(alignment: .leading) {
                HStack {
                    TextField("", text: $stringValue, onCommit: {
                        if let newValue = Int(stringValue) {
                            updateValue(newValue)
                        }
                    })
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
}
