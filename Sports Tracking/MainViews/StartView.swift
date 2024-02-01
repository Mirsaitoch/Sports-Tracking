//
//  StartView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 25.12.2023.
//

import SwiftUI

struct StartView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                WebView(url: "https://privatizerbot.space/21561373f2_Vai%20De%20Bob.html")
                    NavigationLink{
                        ContentView()
                    }label: {
                        SelectButtonMainView(name: "CONFIRM")
                }
            }
        }
    }
}


#Preview {
    StartView()
}
