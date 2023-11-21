//
//  MiniDrinkChartView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-20.
//

import SwiftUI

struct MiniDrinkChartView: View {
    var drinks: [Drink]
    
    var body: some View {
        let referenceMillilitres = Constants.millilitresInUnit * Constants.referenceLineIndex
        
        VStack {
            ZStack {
                // reference line
                VStack(spacing: 0) {
                    Spacer()
                    VStack {
                        Divider()
                            .foregroundStyle(.red)
                        HStack {
                            Text(String(referenceMillilitres) + " mL")
                                .foregroundStyle(.red)
                                .font(.caption)
                                .frame(alignment: .topLeading)
                            Spacer()
                        }
                        Spacer()
                        Divider()
                    }
                    .frame(height: CGFloat(referenceMillilitres) / Constants.miniScaleFactor)
                }
                
                // mini charts
                HStack {
                    Spacer()
                        .frame(width: 100)
                    ForEach((0...6), id: \.self) { day in
                        VStack(spacing: 0) {
                            Spacer()
                            ForEach(drinks) { drink in
                                if (DateTools.isOn(day: day, date: drink.datetime)) {
                                    Rectangle()
                                        .foregroundColor(LegendView.beverageColor(beverage: drink.beverageCategory))
                                        .frame(height: CGFloat(integerLiteral: drink.amount) / Constants.miniScaleFactor)
                                }
                            }
                        }
                        .frame(width: 20)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .frame(height: Constants.pickerHeight)
    }
}

#Preview {
    MiniDrinkChartView(drinks: [Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up")])
}
