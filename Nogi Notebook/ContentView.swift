//
//  ContentView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            WorkoutListView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleWorkouts = Workout.generateSampleWorkouts(count: 10)
        let workoutStore = WorkoutStore(workouts: sampleWorkouts)
        return ContentView().environmentObject(workoutStore)
    }
    
}



