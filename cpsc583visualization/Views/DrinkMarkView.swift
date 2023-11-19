//
//  DrinkMarkView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//
//  Clickable rectange that encodes
//   a) drink amount (height)
//   b) drink type category (colour)
//   c) drink time (horizontal displacement)
// 

import SwiftUI
import SwiftData

struct DrinkMarkView: View {
    let drink: Drink
    let width: CGFloat = 500
    let widthDivisor: CGFloat = 60 * 24
    let heightDivisor: CGFloat = 10
    @Binding var targetDrink: Drink?

    var body: some View {
        Button {
            targetDrink = drink
        } label: {
            HStack {
                Spacer()
                    .frame(width: CGFloat(DateTools.minuteOfDay(datetime: drink.datetime)) / widthDivisor * width)
                VStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(LegendView.beverageColor(beverage: drink.beverageCategory))
                    Divider()
                }
                .frame(height: CGFloat(integerLiteral: drink.amount) / heightDivisor)
            }
            .frame(width: width)
        }
        .buttonStyle(.plain)
    }
}

struct DrinkMarkView_Previews: PreviewProvider {
    static let drink = Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up")
    
    static var previews: some View {
        DrinkMarkView(drink: drink, targetDrink: .constant(drink))
    }
}
