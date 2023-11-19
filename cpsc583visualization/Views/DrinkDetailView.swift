//
//  DrinkDetailText.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//
//  Text for drink details on demand:
//   a) drink time
//   b) drink type
//   c) drink amount
//   d) drink context
//

import SwiftUI

struct DrinkDetailView: View {
    var drink: Drink

    var body: some View {
        let timestamp: String = DateTools.timeOfDay(datetime: drink.datetime)
        let descriptor = drink.beverage + ": " + String(drink.amount) + " mL"
        let reason = "context: " + drink.context

        VStack(spacing: 5) {
            TextRectangle(text: timestamp)
                .frame(alignment: .leading)
            TextRectangle(text: descriptor)
                .frame(alignment: .leading)
            TextRectangle(text: reason)
        }
    }
}

#Preview {
    DrinkDetailView(drink: Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up"))
}
