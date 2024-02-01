//
//  Modifiers.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 01.02.2024.
//

import Foundation
import SwiftUI

struct ExerciseNameBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(Rectangle())
            .frame(minWidth: 150, maxWidth: .infinity, minHeight: 120)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange.opacity(0.9), Color.red.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .blur(radius: 5)
            .overlay(
                content
                    .foregroundColor(.black)
                    .font(.system(size: 25, design: .rounded).bold())
                    .padding()
            )
            .cornerRadius(15)
            .padding(5)
    }
}
