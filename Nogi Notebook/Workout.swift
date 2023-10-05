//
//  Workout.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let name: String
    let startTime: Date
    let endTime: Date
    let submissions: Int
    let taps: Int
    let sweeps: Int
    let rounds: Int
    let roundLength: Int
    
    var duration: TimeInterval {
        return endTime.timeIntervalSince(startTime)
    }

    static var sample: Workout {
        return Workout(name: "NoGi", startTime: Date(), endTime: Date(), submissions: 5, taps: 2, sweeps: 3, rounds: 4, roundLength: 6)
    }
}


