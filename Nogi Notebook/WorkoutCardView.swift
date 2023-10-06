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
                VStack {
                    VStack {
                        Text(dayFormatter.string(from: workout.startTime))
                            .font(.system(size: 12))
                        Text(dateFormatter.string(from: workout.startTime))
                            .bold()
                    }
                    .foregroundStyle(.black)
                    .padding(2)
                    .background(Color.white)
                    .cornerRadius(5)
                    Spacer()
                }
                

                // Workout details (Blue)
                VStack(alignment: .leading) {
                    Text(workout.name)
                        .bold()
                    Text("• \(workout.rounds) x Rounds")
                    Text("• \(workout.submissions) x Submissions")
                    Text("• \(workout.taps) x Taps")
                    Text("• \(workout.sweeps) x Sweeps")
                }
                .multilineTextAlignment(.leading)
                .foregroundStyle(.white)
                .padding(.leading, 10)

                Spacer()

                // Duration section (Gray)
                VStack(alignment: .leading) {
                    Text(format(duration: workout.duration))
                        .font(.headline)
                        .foregroundStyle(.gray)
                }
                .padding()
                .font(.system(size: 12))
            }
            .padding()
            .frame(minWidth: 350, maxHeight: 150)
            .background(
                // Using a ZStack to overlay colors and divide the card into three sections
                ZStack {
                    Color.white
                    GeometryReader { geometry in
                        Color.blue.opacity(0.9)
                            .frame(width: geometry.size.width / 3 * 2)
                        Color.black
                            .opacity(0.85)
                            .frame(width: geometry.size.width / 3)
                            .offset(x: geometry.size.width / 3 * 2)
                    }
                }
            )
            .cornerRadius(10)
            .shadow(radius: 5)
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
        startTime: Date(),
        endTime: Date(),
        submissions: 3,
        taps: 2,
        sweeps: 4,
        rounds: 5,
        roundLength: 6
    )
}
