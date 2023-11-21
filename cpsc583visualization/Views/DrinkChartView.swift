//
//  DrinkChartView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//
//  Chart that arranges drink marks and supplies x/y-axes
//

import SwiftUI

struct DrinkChartView: View {
    var drinks: [Drink]
    var day: Int
    @Binding var targetDrink: Drink?

    var body: some View {
        let filteredDrinks = filterDrinksByDay(drinks: drinks, day: day)
        let totalAmount = getTotalDrinkAmount(drinks: filteredDrinks)
        let referenceLineCount = max(Constants.referenceLineIndex, totalAmount / Constants.millilitresInUnit + 1)
        
        VStack(spacing: 0) {
            ZStack {
                // y-axis
                VStack(spacing: 0) {
                    Spacer()
                    ForEach((1...referenceLineCount).reversed(), id: \.self) { cup in
                        VStack(spacing: 0) {
                            // make reference line red
                            if (cup == Constants.referenceLineIndex) {
                                Divider()
                                    .foregroundStyle(.red)
                                Text(String(cup * Constants.millilitresInUnit))
                                    .foregroundStyle(.red)
                                    .font(.caption)
                                    .frame(width: Constants.chartWidth, alignment: .topLeading)
                            } else {
                                Divider()
                                Text(String(cup * Constants.millilitresInUnit))
                                    .font(.caption)
                                    .frame(width: Constants.chartWidth, alignment: .topLeading)
                            }
                            Spacer()
                        }
                        .frame(width: Constants.chartWidth, height: CGFloat(Constants.millilitresInUnit) / Constants.millilitreScaleFactor)
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
                                DrinkMarkView(drink: drink, targetDrink: $targetDrink)
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
                        .frame(width: Constants.xAxisWidth / 24, alignment: .leading)
                }
                Spacer()
                    .frame(width: Constants.bottleWidth)
            }
            Text("time")
                .font(.caption)
        }
        .frame(width: Constants.chartWidth, alignment: .bottom)
        .padding()
    }
}

#Preview {
    DrinkChartView(drinks: [], day: 2, targetDrink: .constant(nil))
}
