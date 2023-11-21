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
    @Binding var targetDrink: Drink?

    var body: some View {
        Button {
            targetDrink = drink
        } label: {
            HStack {
                Spacer()
                    .frame(width: CGFloat(DateTools.minuteOfDay(datetime: drink.datetime)) / CGFloat(Constants.minutesInDay) * Constants.xAxisWidth)
                VStack(spacing: 0) {
                    RoundedRectangle(cornerSize: Constants.markCorners)
                        .foregroundColor(LegendView.beverageColor(beverage: drink.beverageCategory))
                }
                .frame(width: Constants.markWidth, height: CGFloat(integerLiteral: drink.amount) / Constants.millilitreScaleFactor)
                Spacer()
                VStack(spacing: 0) {
                    RoundedRectangle(cornerSize: Constants.markCorners)
                        .foregroundColor(LegendView.beverageColor(beverage: drink.beverageCategory))
                    Divider()
                }
                .frame(width: Constants.bottleWidth, height: CGFloat(integerLiteral: drink.amount) / Constants.millilitreScaleFactor)

            }
            .frame(width: Constants.xAxisWidth + Constants.bottleWidth)
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
