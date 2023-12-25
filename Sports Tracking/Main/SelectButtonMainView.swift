//
//  SelectButtonMainView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 19.12.2023.
//

import SwiftUI

struct SelectButtonMainView: View {
    var name: String
    var body: some View {
        Text(name)
            .clipShape(Rectangle())
            .frame(minWidth: 150, maxWidth: .infinity, minHeight: 70)
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .heavy))
            .cornerRadius(15)
            .padding(5)
            .containerRelativeFrame(.horizontal){ width, axis in
                width * 0.7}  
    }
}

#Preview {
    SelectButtonMainView(name: "WORKOUT")
}
