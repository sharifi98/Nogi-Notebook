//
//  ContentView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddTraningView = false
    @StateObject private var workoutStore = WorkoutStore()
    
    var body: some View {
        NavigationStack {
            
            List(workoutStore.workouts) { workout in
                HStack {
                    Text("\(workout.date)")
                    Spacer()
                    Text("\(workout.rounds) rounds")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add") {
                        showAddTraningView = true
                    }
                }
            }
            .sheet(isPresented: $showAddTraningView) {
                AddTraningView(showAddTraningView: $showAddTraningView)
                    .environmentObject(workoutStore) // ensure the environmentObject is passed down
            }
        }
    }
}

#Preview {
    ContentView()
}
