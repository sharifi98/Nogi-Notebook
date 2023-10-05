//
//  WorkoutCardView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 05/10/2023.
//

import SwiftUI

struct WorkoutCardView: View {
    var workout: Workout
    
    public init(workout: Workout) {
        self.workout = workout
    }
    
    func format(duration: TimeInterval) -> String {
        let hours = Int(duration) / 3600
        let minutes = Int(duration) % 3600 / 60
        return String(format: "%02i:%02i", hours, minutes) // This will give you HH:MM format
    }
    
    
    private var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }()
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }()
    
    private var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }()
    
    public var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(dayFormatter.string(from: workout.startTime))
                        .padding()
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Text(dateFormatter.string(from: workout.startTime))
                }
                .bold()
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .shadow(radius: 5)
                
                Spacer()
                
                VStack {
                    Text(workout.name)
                        .bold()
                    Text("Rounds: \(workout.rounds)")
                    Text("Rounds: \(workout.rounds)")
                }
                
                Spacer()
                
                VStack {
                    Text(format(duration: workout.duration))
                        .font(.headline)
                        .foregroundColor(.gray) // Or any color you think is appropriate
                }
                
                Spacer()
            }
        }
        .padding()
        .frame(minWidth: 350)
        .background(Color.blue.opacity(0.3))
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
}

struct WorkoutCardView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCardView(workout: sampleWorkout)
            .padding()
            .previewLayout(.sizeThatFits)
    }
    
    static let sampleWorkout = Workout(
        name: "NoGi",
        startTime: Date(),
        endTime: Date(),
        submissions: 3,
        taps: 2,
        sweeps: 4,
        rounds: 5,
        roundLength: 6
    )
}
