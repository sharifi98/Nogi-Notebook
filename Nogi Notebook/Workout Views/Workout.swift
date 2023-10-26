//
//  Workout.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import Foundation

struct Workout: Identifiable {
    var id = UUID()
    var name: String
    var notes: String
    var startTime: Date
    var endTime: Date
    var submissions: Int
    var taps: Int
    var sweeps: Int
    var takedowns: Int
    var rounds: Int
    var roundLength: Int
    
    var duration: TimeInterval {
        return endTime.timeIntervalSince(startTime)
    }
    
    static var sample: Workout {
        return Workout(name: "NoGi",
                       notes: "",
                       startTime: Date(),
                       endTime: Date()+1,
                       submissions: 5,
                       taps: 2,
                       sweeps: 3,
                       takedowns: 2,
                       rounds: 4,
                       roundLength: 6)
    }


}

extension Workout {
    static func generateSampleWorkouts(count: Int) -> [Workout] {
        return (1...count).map { _ in
            let randomName = ["Gi", "NoGi"].randomElement() ?? "NoGi" // Defaults to "NoGi" if for some reason randomElement returns nil
            return Workout(name: randomName,
                    notes: "Today i got my blue belt",
                    startTime: Date(),
                    endTime: Date().addingTimeInterval(3600),
                    submissions: Int.random(in: 0...5),
                    taps: Int.random(in: 0...2),
                    sweeps: Int.random(in: 0...4),
                    takedowns: Int.random(in: 0...4),
                    rounds: Int.random(in: 3...6),
                    roundLength: 6)
        }
    }
}
