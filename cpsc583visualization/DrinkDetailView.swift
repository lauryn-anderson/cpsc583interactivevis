//
//  DrinkDetailView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//

import SwiftUI

struct DrinkDetailView: View {
    @Binding var targetDrink: Drink?
    
    var body: some View {
        VStack {
            Spacer()
            if let drink = targetDrink {
                DrinkDetailText(drink: drink)
            } else {
                Text("Select a drink to see details")
                    .padding(10)
            }
            Spacer()
        }
        .frame(width: 150, alignment: .leading)
        .background(.selection)
    }
}

#Preview {
    DrinkDetailView(targetDrink: .constant(Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "water", beverage: "water", contextCategory: "routine", context: "wake up")))
}
