//
//  Exercise.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 16.12.2023.
//

import Foundation


class Exercise: Codable, Hashable{
    var name: String
    var type: String
    var muscle: String
    var equipment: String
    var difficulty: String
    var instructions: String
    
    init(name: String, type: String, muscle: String, equipment: String, difficulty: String, instructions: String) {
        self.name = name
        self.type = type
        self.muscle = muscle
        self.equipment = equipment
        self.difficulty = difficulty
        self.instructions = instructions
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name
    }
}
