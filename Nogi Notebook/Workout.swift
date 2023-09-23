//
//  Workout.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import Foundation

struct Workout: Identifiable {
    let id = UUID()
    let date: Date
    let submissions: Int
    let taps: Int
    let sweeps: Int
    let rounds: Int
    let roundLength: Int
}

