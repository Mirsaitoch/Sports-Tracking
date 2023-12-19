//
//  ExercisesView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 19.12.2023.
//

import SwiftUI

struct ExercisesView: View {
    
    let exercises : [Exercise]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let muscleGroups = [
        "abdominals",
        "abductors",
        "adductors",
        "biceps",
        "calves",
        "chest",
        "forearms",
        "glutes",
        "hamstrings",
        "lats",
        "lower_back",
        "middle_back",
        "neck",
        "quadriceps",
        "traps",
        "triceps"
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(exercises, id: \.name) { exercise in
                ExercisesItem(exercise: exercise)
            }
        }
        .padding(.horizontal)   
    }
}

struct ExercisesItem: View {
    var exercise: Exercise
    
    var body: some View {
        NavigationLink(destination: ExerciseView(exercise: exercise)) {
            Text("")
                .clipShape(Rectangle())
                .frame(minWidth: 150, maxWidth: .infinity, minHeight: 120)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.orange.opacity(0.9),
                            Color.red.opacity(0.8)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .blur(radius: 5)
                .overlay(
                    Text(exercise.name)
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                )
                .cornerRadius(15)
                .padding(5)
            
        }
    }
}

#Preview {
    ExercisesView(exercises: [Exercise(name: "Incline Hammer Curls", type: "", muscle: "", equipment: "", difficulty: "", instructions: "Stand up with your torso upright while holding a barbell at the wide outer handle. The palm of your hands should be facing forward. The elbows should be close to the torso. This will be your starting position. While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Tip: Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard. Slowly begin to bring the bar back to starting position as your breathe in. Repeat for the recommended amount of repetitions.  Variations:  You can also perform this movement using an E-Z bar or E-Z attachment hooked to a low pulley. This variation seems to really provide a good contraction at the top of the movement. You may also use the closer grip for variety purposes.")])
}
