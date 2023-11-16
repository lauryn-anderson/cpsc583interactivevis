//
//  ContentView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(
        filter: #Predicate<Drink> { drink in
            drink.person == "Lauryn"
        },
        sort: \Drink.datetime, order: .reverse
    ) private var drinks: [Drink]
    @Environment(\.modelContext) private var modelContext
    @State var targetDrink: Drink? = nil

    var body: some View {
        HStack {
            ScrollView {
                HStack {
                    ForEach((0...0), id: \.self) { day in
                        DrinkStackView(drinks: drinks, day: day, targetDrink: $targetDrink)
                    }
                }
            }
            DrinkDetailView(targetDrink: $targetDrink)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
