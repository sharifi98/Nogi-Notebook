//
//  WorkoutListView.swift
//  Nogi Notebook
//
//  Created by Hossein Sharifi on 21/10/2023.
//

import SwiftUI

struct WorkoutListView: View {
    @EnvironmentObject private var workoutStore: WorkoutStore
    @State private var showAddTraningView = false
    @State private var isInEditMode = false
    
    
    
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
        NavigationView {
            
            ScrollView {
                
                VStack {
                    ForEach(workoutStore.workouts.indices.reversed(), id: \.self) { index in
                        HStack {
                            if isInEditMode {
                                Button(action: {
                                    withAnimation {
                                        workoutStore.remove(at: index)
                                    }
                                }) {
                                    Image(systemName: "minus.circle.fill")
                                        .foregroundColor(.red)
                                        .padding(.trailing, 4)
                                }
                            }
                            
                            NavigationLink(destination: FinishedWorkoutView(workout: workoutStore.workouts[index])) {
                                WorkoutCardView(workout: workoutStore.workouts[index])
                            }
                            .contextMenu(ContextMenu(menuItems: {
                                Text("Menu Item 1")
                                Text("Menu Item 2")
                                Text("Menu Item 3")
                            }))
                        }
                        .transition(.slide)
                    }
                }
                .padding()
                //.animation(.easeInOut(duration: 0.3))
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showAddTraningView = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .foregroundStyle(.black)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            withAnimation(.bouncy(duration: 0.3)) {
                                isInEditMode.toggle()
                            }
                        }) {
                            Text(isInEditMode ? "Done" : "Edit")
                                .foregroundStyle(.black)
                        }
                    }
                }
                .fullScreenCover(isPresented: $showAddTraningView) {
                    AddTraningView(showAddTraningView: $showAddTraningView)
                        .environmentObject(workoutStore)
                }
            }
            .navigationTitle("Log")
        }
    }
}


struct WorkourListView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleWorkouts = Workout.generateSampleWorkouts(count: 10)
        let workoutStore = WorkoutStore(workouts: sampleWorkouts)
        return WorkoutListView().environmentObject(workoutStore)
    }
}
