//
//  ExerciseView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 16.12.2023.
//

import SwiftUI
import SwiftData

struct ExerciseView: View {
    @Environment(\.modelContext) var modelContext
    @State private var isButtonActive = false

    var exercise: Exercise
    var body: some View {
        Text(exercise.name)
            .font(.title)
        ScrollView{
            Text(exercise.instructions)
                .bold()
                .clipShape(.rect)
            
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    modelContext.insert(Result(name: exercise.name, date: .now, type: exercise.type, muscle: exercise.muscle, difficulty: exercise.difficulty))
                    isButtonActive = true
                } label: {
                    Image(systemName: isButtonActive ? "checkmark.square" : "checkmark.square")
                        .foregroundColor(isButtonActive ? .gray : .green)
                }
                .disabled(isButtonActive)
            }
        }
    }
}

#Preview {
    ExerciseView(exercise: Exercise(name: "Incline Hammer Curls", type: "", muscle: "", equipment: "", difficulty: "", instructions: "Stand up with your torso upright while holding a barbell at the wide outer handle. The palm of your hands should be facing forward. The elbows should be close to the torso. This will be your starting position. While holding the upper arms stationary, curl the weights forward while contracting the biceps as you breathe out. Tip: Only the forearms should move. Continue the movement until your biceps are fully contracted and the bar is at shoulder level. Hold the contracted position for a second and squeeze the biceps hard. Slowly begin to bring the bar back to starting position as your breathe in. Repeat for the recommended amount of repetitions.  Variations:  You can also perform this movement using an E-Z bar or E-Z attachment hooked to a low pulley. This variation seems to really provide a good contraction at the top of the movement. You may also use the closer grip for variety purposes."))
}
