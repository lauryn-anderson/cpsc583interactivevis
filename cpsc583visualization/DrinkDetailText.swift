//
//  DrinkDetailText.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//

import SwiftUI

struct DrinkDetailText: View {
    var drink: Drink

    var body: some View {
        let timestamp: String = DateTools.timeOfDay(datetime: drink.datetime) + "\n"
        let descriptor = timestamp + drink.beverage + ": " + String(drink.amount) + "mL\ncontext: " + drink.context
        Text(descriptor)
    }
}

#Preview {
    DrinkDetailText(drink: Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up"))
}
