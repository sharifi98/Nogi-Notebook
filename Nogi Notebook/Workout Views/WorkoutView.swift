//
//  WorkoutView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 17/10/2023.
//

import SwiftUI

struct WorkoutView: View {
    var workout: Workout
    let formatter: DateFormatter
    
    public init(workout: Workout) {
        self.workout = workout
        
        self.formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d 'at' HH:mm"
    }
    
    var body: some View {
        VStack {
           VStack {
                Text("\(workout.name)")
                    .font(.system(size: 66))
                    .bold()
                Text(formatter.string(from: workout.startTime))
                    .font(.system(size: 22))
                    .foregroundStyle(.gray)
               
               Text("\(workout.duration)")
                   .foregroundStyle(.gray)
            }
            .glassmorphismBackground(minWidth: 350, maxHeight: 140)
            
            
            VStack {
                Text("Notes")
                Text(workout.notes)
                Spacer()
            }
            .glassmorphismBackground(minWidth: 350, maxHeight: 150)
            
            
            Spacer()
            
            VStack(spacing: 20) {
                HStack{
                    metricView(title: "SUBMISSIONS", value: workout.submissions)
                    metricView(title: "TAPS", value: workout.taps)
                }
                HStack {
                    metricView(title: "SWEEPS", value: workout.sweeps)
                    metricView(title: "TAKEDOWNS", value: workout.takedowns)
                }
            }
        }
        .padding()
    }
    
    private func metricView(title: String, value: Int) -> some View {
        VStack {
            Text(title)
                .font(.system(size: 15))
            Text("\(value)")
                .font(.system(size: 60))
        }
        .bold()
        .glassmorphismBackground(minWidth: 170, maxHeight: 150)
    }
}

struct WorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutView(workout: sampleWorkout)
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
