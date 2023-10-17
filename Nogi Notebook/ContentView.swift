//
//  ContentView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 22/09/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var workoutStore: WorkoutStore
    @State private var showAddTraningView = false
    
    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }
    
    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "en_GB")
        return formatter
    }
    
    
    
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(workoutStore.workouts.reversed()) { workout in
                        NavigationLink(destination: WorkoutView(workout: workout)) {
                                WorkoutCardView(workout: workout)
                                .padding(4)
                        }
                        .contextMenu(ContextMenu(menuItems: {
                            Text("Menu Item 1")
                            Text("Menu Item 2")
                            Text("Menu Item 3")
                        }))
                    }
                    
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddTraningView = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundStyle(.cyan)
                        }
                    }
                }
                .fullScreenCover(isPresented: $showAddTraningView) {
                    AddTraningView(showAddTraningView: $showAddTraningView)
                        .environmentObject(workoutStore) // ensure the environmentObject is passed down
            }
            }
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


