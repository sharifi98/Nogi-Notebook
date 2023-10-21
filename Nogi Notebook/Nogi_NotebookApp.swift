//
//  Nogi_NotebookApp.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

@main
struct NogiNotebookApp: App {
    @StateObject var workoutStore = WorkoutStore() // Initialize with your data or leave empty

    var body: some Scene {
        WindowGroup {
            let sampleWorkouts = Workout.generateSampleWorkouts(count: 10)
            let workoutStore = WorkoutStore(workouts: sampleWorkouts)
            ContentView().environmentObject(workoutStore)
                .preferredColorScheme(.dark)
        }
    }
}

