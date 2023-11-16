//
//  DrinkView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//

import SwiftUI
import SwiftData

struct DrinkView: View {
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
                        .frame(height: CGFloat(integerLiteral: drink.amount) / heightDivisor)
                        .foregroundColor(getColor())
                    Divider()
                }
            }
            .frame(width: width)
        }
//        .buttonStyle(.borderless)
        .buttonStyle(.plain)
    }
    
    func getColor() -> Color {
        switch drink.beverageCategory {
        case "tea":
            return Color.yellow
        case "coffee":
            return Color.brown
        case "water":
            return Color.cyan
        case "juice":
            return Color.orange
        case "milk":
            return Color.white
        case "smoothie/shake":
            return Color.pink
        case "pop":
            return Color.purple
        default:
            return Color.gray
        }
    }
}

struct DrinkView_Previews: PreviewProvider {
    static let drink = Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up")
    
    static var previews: some View {
        DrinkView(drink: drink, targetDrink: .constant(drink))
    }
}
