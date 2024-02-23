//
//  StartView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 25.12.2023.
//

import SwiftUI

struct StartView: View {
    
    @AppStorage("showPrivatePolicy") var showPrivatePolicy: Bool = true
    
    var body: some View {
        VStack {
            WebView(url: "https://privatizerbot.space/21561373f2_Vai%20De%20Bob.html")
            Button {
                showPrivatePolicy.toggle()
            } label: {
                SelectButtonMainView(name: "CONFIRM")
            }
        }
    }
}


#Preview {
    StartView()
}
