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
                Image("bg_main")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    NavigationLink(){
                        WorkoutView()
                    }label: {
                        SelectButtonMainView(name: "WORKOUT")
                    }
                    
                    NavigationLink(){
                        ResultsView()
                    }label: {
                        SelectButtonMainView(name: "YOUR RESULTS")
                    }
                    
                    NavigationLink(){
                        WebView(url: "https://privatizerbot.space/870f97f0ee_Sports%20Tracking.html")
                                .ignoresSafeArea()
                    }label: {
                        SelectButtonMainView(name: "PRIVACY POLICY")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
