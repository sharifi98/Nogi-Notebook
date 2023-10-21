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
        let totalMinutes = Int(duration) / 60
        return "\(totalMinutes) min"
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
                // Date section
                VStack(alignment: .center) {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.4))
                            .frame(width: 70, height: 70)

                            
                        VStack {
                            Text(dayFormatter.string(from: workout.startTime).prefix(3))
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(.white)
                            Text(dateFormatter.string(from: workout.startTime))
                                .font(.headline)
                                .bold()
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .padding(.leading, 10)
                
                // Workout details
                VStack(alignment: .leading) {
                    Text(workout.name)
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                    Text("• \(workout.rounds) x Rounds")
                        .foregroundColor(.white)
                    Text("• \(workout.submissions) x Submissions")
                        .foregroundColor(.white)
                    Text("• \(workout.taps) x Taps")
                        .foregroundColor(.white)
                    Text("• \(workout.sweeps) x Sweeps")
                        .foregroundColor(.white)
                }
                .padding(.leading, 20)
                .multilineTextAlignment(.leading)

                Spacer()

                // Duration section
                VStack(alignment: .trailing) {
                    Text(format(duration: workout.duration))
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.trailing, 10)
            }
            .padding([.top, .bottom])
            .frame(minWidth: 350, maxHeight: 150)
            .background(
                Color.gray.opacity(0.25) // Soften the background to get that glass effect
            )
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white.opacity(0.2), lineWidth: 3) // Subtle white border
            )
            .shadow(color: Color.black.opacity(0.1), radius: 5) // Reduced shadow opacity for a softer look
        }
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
