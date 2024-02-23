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

    @State var exercise: Exercise
    
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

            ScrollView(showsIndicators: false) {
                Text(exercise.instructions)
                    .exerciseInstructionStyle()
            }
            .padding()
            
            NavigationLink {
                TimerView(exercise: exercise)
            } label: {
                Text("LET'S DO IT!")
                    .exerciseInstructionStyle()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

#Preview {
    ExerciseView(exercise: Exercise(name: "Incline Hammer Curls", type: "", muscle: "neck", equipment: "", difficulty: "", instructions: "Stand up with your torso upright while holding a barbell!"))
}
