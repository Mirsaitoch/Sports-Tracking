//
//  Result.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 16.12.2023.
//

import Foundation
import SwiftData

@Model
class Result{
    var name: String
    var date: Date
    var type: String
    var muscle: String
    var difficulty: String
    
    init(name: String, date: Date, type: String, muscle: String, difficulty: String) {
        self.name = name
        self.date = date
        self.type = type
        self.muscle = muscle
        self.difficulty = difficulty
    }
    
}
