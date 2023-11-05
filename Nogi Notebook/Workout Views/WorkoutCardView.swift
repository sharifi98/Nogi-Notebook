//
//  WorkoutCardView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 05/10/2023.
//

import SwiftUI

struct WorkoutCardView: View {
    var workout: Workout

    // MARK: - Date Formatters
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

    // MARK: - Initializer
    public init(workout: Workout) {
        self.workout = workout
    }

    // MARK: - Utility Functions
    func format(duration: TimeInterval) -> String {
        let totalMinutes = Int(duration) / 60
        return "\(totalMinutes) min"
    }

    // MARK: - Body
    public var body: some View {
        VStack {
            HStack {
                DateSection(workout: workout, dayFormatter: dayFormatter, dateFormatter: dateFormatter)
                WorkoutDetails(workout: workout)
                Spacer()
                DurationSection(duration: workout.duration, format: format)
            }
            .padding([.top, .bottom])
            .frame(minWidth: 350, maxHeight: 150)
            .background(Color.white) // Playing cards are typically white
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5) // Add a border line to mimic the edge of a card
            )
            .shadow(color: .gray, radius: 5, x: 0, y: 2) // A subtle shadow to give a 3D effect
        }
        .padding(3)
        .background(Color.gray.opacity(0.2)) // A slight backdrop shadow for more depth
}

    // MARK: - Subviews
    struct DateSection: View {
        var workout: Workout
        var dayFormatter: DateFormatter
        var dateFormatter: DateFormatter

        var body: some View {
            VStack(alignment: .center) {
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.9))
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
        }
    }
    
    struct WorkoutDetails: View {
        var workout: Workout

        var body: some View {
            VStack(alignment: .leading) {
                Text(workout.name)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.black)

                ForEach([
                    ("\(workout.rounds) x Rounds", Color.gray),
                    ("\(workout.submissions) x Submissions", Color.gray),
                    ("\(workout.taps) x Taps", Color.gray),
                    ("\(workout.sweeps) x Sweeps", Color.gray),
                    ("\(workout.takedowns) x Takedowns", Color.gray)
                ], id: \.0) { text, color in
                    Text(text).foregroundColor(color)
                }
            }
            .padding(.leading, 20)
            .multilineTextAlignment(.leading)
        }
    }
    
    struct DurationSection: View {
        var duration: TimeInterval
        var format: (TimeInterval) -> String

        var body: some View {
            VStack(alignment: .trailing) {
                Text(format(duration))
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(.trailing, 10)
        }
    }
}

// MARK: - Previews
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
