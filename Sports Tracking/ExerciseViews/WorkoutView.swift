//
//  WorkoutView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 16.12.2023.
//

import SwiftUI

struct WorkoutView: View {
    @State var viewModel = ViewModel()
    @State private var exercises : [Exercise] = []
    @State private var showData = false
    
    @State private var selectedMuscle = "biceps"
    
    var body: some View {
        VStack{
            if showData{
                ExercisesView(exercises: exercises)
                    .padding(.horizontal, 20)
            }
            else{
                ZStack {
                    Image("bg")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                }
            }
        }
        .onAppear(perform: {
            viewModel.getExercises(selectedMuscle: selectedMuscle) { (exercises, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let exercises = exercises {
                    self.exercises = exercises
                    showData = true
                }
            }
        })
        .toolbar{
            Menu("Choose muscle", systemImage: "figure.walk") {
                ForEach(viewModel.muscleGroups, id: \.self) { muscle in
                    Picker(selection: $selectedMuscle, label: Text(muscle)) {
                        Text(muscle)
                            .tag(muscle)
                    }
                }
            }
            
            .onChange(of: selectedMuscle) {
                showData = false
                viewModel.getExercises(selectedMuscle: selectedMuscle) { (exercises, error) in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let exercises = exercises {
                        self.exercises = exercises
                        showData = true
                    }
                }
            }
        }
    }
}


#Preview {
    WorkoutView()
}
