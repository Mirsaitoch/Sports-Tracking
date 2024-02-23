//
//  ResultsView.swift
//  Sports Tracking
//
//  Created by Мирсаит Сабирзянов on 16.12.2023.
//

import SwiftUI
import SwiftData

struct ResultsView: View {
    
    @StateObject var resultViewModel = ResultViewModel()
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Result.date, order: .reverse) var results: [Result]
    
    var body: some View {
        VStack{
            Text("Results")
                .foregroundStyle(.white)
                .font(.system(size: 30, design: .rounded).bold())
            ScrollView(showsIndicators: false){
                ForEach(Array(results.enumerated()), id: \.element.id) { index, result in
                        HStack {
                            Image(systemName: "\(index + 1).circle")
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                                .padding([.trailing])
                            VStack{
                                Text(result.name)
                                Text(resultViewModel.formattedDate(result.date))
                            }
                            .foregroundColor(.white)
                            Spacer()
                        }
                        .frame(width: UIScreen.main.bounds.width * 0.7)
                        .background(.ultraThinMaterial)
                        .clipShape(.rect(cornerRadius: 10))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 5)
                }
                .onDelete(perform: resultViewModel.removeItem)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(
                Image("bg")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

#Preview {
    ResultsView()
}
