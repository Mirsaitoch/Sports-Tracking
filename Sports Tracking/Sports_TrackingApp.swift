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
    @AppStorage("showPrivatePolicy") var showPrivatePolicy = true

    var body: some Scene {
        WindowGroup {
            if showPrivatePolicy {
                StartView()
            }
            else {
                ContentView()
            }
        }
        .modelContainer(for: Result.self)
    }
}
