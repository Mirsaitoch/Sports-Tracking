//
//  HealthStore.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 23.02.2024.
//

import HealthKit
import SwiftUI

class HealthStore: ObservableObject {
    var healthStore: HKHealthStore?
    
    var workoutBuilder: HKWorkoutBuilder?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        let typesToWrite: Set<HKSampleType> = [
            HKObjectType.workoutType()
            // Добавьте другие типы данных, если это необходимо
        ]
        
        let typesToRead: Set<HKSampleType> = [
            // Укажите данные, которые вы хотите читать
        ]
        
        healthStore?.requestAuthorization(toShare: typesToWrite, read: typesToRead) { success, error in
            completion(success)
        }
    }
    
    func saveWorkout(activityType: HKWorkoutActivityType, start: Date, end: Date) {
        let configuration = HKWorkoutConfiguration()
        configuration.activityType = activityType
        configuration.locationType = .unknown
        
        workoutBuilder = HKWorkoutBuilder(healthStore: healthStore!, configuration: configuration, device: .local())
        
        workoutBuilder?.beginCollection(withStart: start) { [weak self] (success, error) in
            guard success else {
                print("Ошибка при начале сборки тренировки: \(String(describing: error))")
                return
            }
            
            self?.workoutBuilder?.endCollection(withEnd: end) { (success, error) in
                guard success else {
                    print("Ошибка при завершении сборки тренировки: \(String(describing: error))")
                    return
                }
                
                self?.workoutBuilder?.finishWorkout { (workout, error) in
                    guard let workout = workout else {
                        print("Ошибка при сохранении тренировки: \(String(describing: error))")
                        return
                    }
                    print("Тренировка успешно сохранена: \(workout)")
                }
            }
        }
    }
}
