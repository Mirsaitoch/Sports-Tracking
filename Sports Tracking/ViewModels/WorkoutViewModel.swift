//
//  ExerciseViewModel.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 19.12.2023.
//

import Foundation

extension WorkoutView {
    @Observable
    class ViewModel {
        let muscleGroups = [
            "abdominals",
            "adductors",
            "biceps",
            "calves",
            "chest",
            "forearms",
            "glutes",
            "hamstrings",
            "lats",
            "lower_back",
            "middle_back",
            "neck",
            "quadriceps",
            "traps",
            "triceps"
        ]
        
        func getExercises(selectedMuscle: String, completion: @escaping ([Exercise]?, Error?) -> Void) {
            let muscle = "\(selectedMuscle)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            guard let url = URL(string: "https://api.api-ninjas.com/v1/exercises?muscle=" + muscle!) else {
                completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
                return
            }
            
            var request = URLRequest(url: url)
            request.setValue("rFcljnKIeSseMqjhVS/WwQ==AK3GJ15Zfj6sOiFM", forHTTPHeaderField: "X-Api-Key")
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                guard let data = data else {
                    completion(nil, NSError(domain: "No data received", code: 0, userInfo: nil))
                    return
                }
                
                do {
                    let exercises = try JSONDecoder().decode([Exercise].self, from: data)
                    completion(exercises, nil)
                } catch let decodingError {
                    completion(nil, decodingError)
                }
            }
            
            task.resume()
        }
    }
}

