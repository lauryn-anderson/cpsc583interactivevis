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
        let filteredDrinks = filterDrinksByDay(drinks: drinks, day: day)
        let totalAmount = getTotalDrinkAmount(drinks: filteredDrinks)
        let referenceLineCount = max(8, totalAmount / 250 + 1)
        
        VStack(spacing: 0) {
            ZStack {
                // y-axis
                VStack(spacing: 0) {
                    Spacer()
                    ForEach((1...referenceLineCount).reversed(), id: \.self) { cup in
                        VStack(spacing: 0) {
                            // make reference line red
                            if (cup == 8) {
                                Divider()
                                    .foregroundStyle(.red)
                                Text(String(cup * 250))
                                    .foregroundStyle(.red)
                                    .font(.caption)
                                    .frame(width: width + 40, alignment: .topLeading)
                            } else {
                                Divider()
                                Text(String(cup * 250))
                                    .font(.caption)
                                    .frame(width: width + 40, alignment: .topLeading)
                            }
                            Spacer()
                        }
                        .frame(width: width + 40, height: 25)
                    }
                    Divider()
                }
                
                // bars
                HStack(spacing: 0) {
                    Spacer()
                    Divider()
                    VStack(spacing: 0) {
                        Spacer()
                        ForEach(filteredDrinks) { drink in
                            if (DateTools.isOn(day: day, date: drink.datetime)) {
                                DrinkView(drink: drink, targetDrink: $targetDrink)
                            }
                        }
                    }
                    Divider()
                }
            }
            
            // x-axis
            HStack(spacing: 0) {
                Text("mL")
                    .font(.caption)
                Spacer()
                ForEach((0...23), id: \.self) { hour in
                    Text(String(hour))
                        .font(.caption)
                        .frame(width: width/24, alignment: .leading)
                }
            }
            Text("time")
                .font(.caption)
        }
        .frame(width: width + 40, alignment: .bottom)
        .padding()
    }
}

#Preview {
    DrinkStackView(drinks: [], day: 2, targetDrink: .constant(nil))
}
