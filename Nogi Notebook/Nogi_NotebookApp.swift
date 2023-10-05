//
//  Nogi_NotebookApp.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

@main
struct Nogi_NotebookApp: App {
    let workoutStore = WorkoutStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(workoutStore)
                .colorScheme(.dark)
             
        }
    }
}
