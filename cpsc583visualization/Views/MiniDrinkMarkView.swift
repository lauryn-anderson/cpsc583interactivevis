//
//  MiniDrinkMarkView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-20.
//
//  Miniature bottle stack for clickable overview of week
//

import SwiftUI

struct MiniDrinkMarkView: View {
    let drinks: [Drink]
    let day: Int
    @Binding var targetDay: Int
    
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 0) {
                Spacer()
                    .frame(maxHeight: .infinity)
                ForEach(drinks) { drink in
                    if (DateTools.isOn(day: day, date: drink.datetime)) {
                        Rectangle()
                            .foregroundColor(LegendView.beverageColor(beverage: drink.beverageCategory))
                            .frame(height: CGFloat(integerLiteral: drink.amount) / Constants.miniScaleFactor)
                            .frame(width: Constants.miniBottleWidth)
                    }
                }
            }
            Spacer()
        }
        .background(day == targetDay ? AnyShapeStyle(.selection) : AnyShapeStyle(.clear))
    }
}

#Preview {
    MiniDrinkMarkView(drinks: [Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up")], day: 27, targetDay: .constant(27))
}
