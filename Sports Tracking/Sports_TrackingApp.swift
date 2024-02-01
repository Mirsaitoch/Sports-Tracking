//
//  Sports_TrackingApp.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 16.12.2023.
//

import SwiftUI
import SwiftData
@main
struct Sports_TrackingApp: App {
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
        .modelContainer(for: Result.self)
    }
}
