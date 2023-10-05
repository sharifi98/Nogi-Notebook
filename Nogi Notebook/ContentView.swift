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

    
    private var dayFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "en_GB")  // Norwegian locale
        return formatter
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM"
        formatter.locale = Locale(identifier: "en_GB")  // Norwegian locale
        return formatter
    }

    private var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale(identifier: "en_GB")  // Norwegian locale
        return formatter
    }



    
    
    
    var body: some View {
        NavigationStack {
            
            
            
            List {
                ForEach(workoutStore.workouts) { workout in
                    NavigationLink(destination: Text("Hello")) {
                        HStack {
                            VStack {
                                Text(dayFormatter.string(from: workout.startTime))
                                Spacer(minLength: 10)
                                Text(dateFormatter.string(from: workout.startTime))
                                Spacer(minLength: 10)
                                Text(timeFormatter.string(from: workout.startTime))
                                Spacer()
                            }
                            .padding()
                            Text("\(workout.rounds) rounds")
                        }
                    }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


