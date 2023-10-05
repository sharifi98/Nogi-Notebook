//
//  WorkoutStore.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

class WorkoutStore: ObservableObject {
    @Published var workouts: [Workout]
    
    init(workouts: [Workout] = [Workout.sample]) {
        self.workouts = workouts
    }
    
    func add(workout: Workout) {
        DispatchQueue.main.async {
            self.workouts.append(workout)
        }
    }
}




