//
//  DrinkStackView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//

import SwiftUI

struct DrinkStackView: View {
    var drinks: [Drink]
    var day: Int
    let width: CGFloat = 500
    @Binding var targetDrink: Drink?

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            ForEach(drinks) { drink in
                if (DateTools.isOn(day: day, date: drink.datetime)) {
                    DrinkView(drink: drink, targetDrink: $targetDrink)
//                    Divider()
                }
            }
            HStack(spacing: 0) {
                ForEach((0...23), id: \.self) { hour in
                    Text(String(hour))
                        .font(.caption)
                        .frame(width: width/24, alignment: .leading)
                }
            }
        }
        .frame(width: width)
        .padding()
    }
}

#Preview {
    DrinkStackView(drinks: [], day: 2, targetDrink: .constant(nil))
}
