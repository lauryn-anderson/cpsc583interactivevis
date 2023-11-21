//
//  MiniDrinkChartView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-20.
//
//  Set of clickable mini charts for a week overview
//

import SwiftUI

struct MiniDrinkChartView: View {
    var drinks: [Drink]
    @Binding var targetDay: Int
    
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
                        .frame(width: Constants.miniLabelWidth)
                    ForEach((0...6), id: \.self) { day in
                        Button {
                            targetDay = day
                        } label: {
                            MiniDrinkMarkView(drinks: drinks, day: day, targetDay: $targetDay)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            Spacer()
        }
        .frame(height: Constants.pickerHeight)
    }
}

#Preview {
    MiniDrinkChartView(drinks: [Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up")], targetDay: .constant(27))
}
