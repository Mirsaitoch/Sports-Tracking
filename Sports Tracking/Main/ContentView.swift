//
//  ContentView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink(){
                        WorkoutView()
                    }label: {
                        Text("WORKOUT")
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
                    
                    
                    NavigationLink(){
                        ResultsView()
                    }label: {
                        Text("YOUR RESULTS")
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
                    
                    Button(){
                        print("PRIVACY POLICY")
                    }label: {
                        Text("PRIVACY POLICY")
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
                                width * 0.7
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
