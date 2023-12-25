//
//  ResultViewModel.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 20.12.2023.
//

import Foundation
import SwiftData
import SwiftUI


class ResultViewModel: ObservableObject{
    
    @Environment(\.modelContext) var modelContext
    @Query var results: [Result]
    
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short
            return formatter
        }()
    
    func formattedDate(_ date: Date) -> String {
            return dateFormatter.string(from: date)
        }
    
    func removeItem(at offsets: IndexSet){
        offsets.forEach { index in
            let result = results[index]
            modelContext.delete(result)
        }
    }
}
