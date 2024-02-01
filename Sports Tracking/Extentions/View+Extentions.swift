//
//  Extentions.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 01.02.2024.
//

import Foundation
import SwiftUI

extension View {
    func exerciseInstructionStyle() -> some View {
        self
            .bold()
            .padding(20)
            .clipShape(Rectangle())
            .background(instructionBackgroundGradient)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .heavy))
            .cornerRadius(10)
            .padding(5)
    }
    
    func exerciseNameBackground() -> some View {
            modifier(ExerciseNameBackgroundModifier())
        }
    
    private var instructionBackgroundGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.red.opacity(0.3)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
