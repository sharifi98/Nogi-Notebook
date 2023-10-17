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
                Text("\(workout.name)")
                    .font(.system(size: 66))
                    .bold()
                
            
            Spacer()
            
            VStack {
                HStack {
                    VStack{
                        Text("SUBMISSIONS")
                            .font(.system(size: 20))
                        Text("\(workout.submissions)")
                            .font(.system(size: 80))
                            
                    }
                    .bold()
                    .glassmorphismBackground(minWidth: 170, maxHeight: 150)
                    
                    VStack {
                        Text("Taps")
                            .font(.system(size: 20))
                        Text("\(workout.taps)")
                            .font(.system(size: 80))
                            
                    }
                    .bold()
                    .glassmorphismBackground(minWidth: 170, maxHeight: 150)
                }
                .font(.title2)
                
                HStack {
                    VStack{
                        Text("SWEEPS")
                            .font(.system(size: 20))
                        Text("\(workout.sweeps)")
                            .font(.system(size: 80))
                            
                    }
                    .bold()
                    .glassmorphismBackground(minWidth: 170, maxHeight: 150)
                    
                    VStack {
                        Text("TAKEDOWNS")
                            .font(.system(size: 20))
                        Text("\(workout.takedowns)")
                            .font(.system(size: 80))
                            
                    }
                    .bold()
                    .glassmorphismBackground(minWidth: 170, maxHeight: 150)
                }
                .font(.title2)
            }
        }
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
