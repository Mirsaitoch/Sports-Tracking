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
        VStack{
            Text(exercise.name)
                .foregroundStyle(.white)
                .font(.system(size: 30, design: .rounded).bold())
            Image(exercise.muscle)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .cornerRadius(10)
                .clipShape(Rectangle())

            ScrollView(showsIndicators: false){
                Text(exercise.instructions)
                    .bold()
                    .padding(20)
                    .clipShape(Rectangle())
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.orange.opacity(0.5),
                                Color.red.opacity(0.3)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .heavy))
                    .cornerRadius(10)
                    .padding(5)
            }
            .padding()
        }

        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
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
    ExerciseView(exercise: Exercise(name: "Incline Hammer Curls", type: "", muscle: "neck", equipment: "", difficulty: "", instructions: "Stand up with your torso upright while holding a barbell "))
}
