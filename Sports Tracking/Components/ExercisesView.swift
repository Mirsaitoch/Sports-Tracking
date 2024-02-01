//
//  ExercisesView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 19.12.2023.
//

import SwiftUI

struct ExercisesView: View {
    
    let exercises : [Exercise]
    let columns = [GridItem(.flexible())]
    @State var names: [String] = []

    var body: some View {
            VStack{
                Text(exercises[0].muscle.uppercased())
                    .foregroundStyle(.white)
                    .font(.system(size: 30, design: .rounded).bold())
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(exercises, id: \.self) { exercise in
                            ExerciseItemView(exercise: exercise)
                        }
                    }
                }
            }
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
    ExercisesView(exercises: [Exercise(name: "Running", type: "legs", muscle: "abdominals", equipment: "", difficulty: "", instructions: "Stand up.")])
}
