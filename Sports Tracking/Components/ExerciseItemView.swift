//
//  ExerciseItemView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 01.02.2024.
//

import SwiftUI

struct ExerciseItemView: View {
    var exercise: Exercise
    
    var body: some View {
        NavigationLink(destination: ExerciseView(exercise: exercise)) {
            Text("")
                .exerciseNameBackground()
                .overlay(
                    Text(exercise.name)
                        .foregroundColor(.black)
                        .font(.system(size: 25, design: .rounded).bold())
                        .padding()
                )
        }
    }
}

#Preview {
    ExerciseItemView(exercise: Exercise(name: "", type: "", muscle: "", equipment: "", difficulty: "", instructions: ""))
}
