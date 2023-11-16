//
//  DrinkView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//

import SwiftUI

struct DrinkView: View {
    let drink: Drink
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 100, height: CGFloat(integerLiteral: drink.amount) / 5)
                .foregroundColor(.green)
            Text(drink.beverageCategory)
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkView(drink: Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up"))
    }
}
