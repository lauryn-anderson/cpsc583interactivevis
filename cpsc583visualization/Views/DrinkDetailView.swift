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
            if let drink = targetDrink {
                DrinkDetailText(drink: drink)
                    .frame(alignment: .top)
            } else {
                TextRectangle(text: "Select a drink to see details")
                    .frame(alignment: .top)
            }
            Spacer()
            Legend()
                .frame(height: 300)
        }
        .padding(10)
        .frame(width: 150, alignment: .topLeading)
        .background(.selection)
    }
}

#Preview {
    DrinkDetailView(targetDrink: .constant(Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "water", beverage: "water", contextCategory: "routine", context: "wake up")))
}
