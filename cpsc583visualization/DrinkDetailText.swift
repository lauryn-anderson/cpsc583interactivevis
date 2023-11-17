//
//  DrinkDetailText.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//

import SwiftUI

struct DrinkDetailText: View {
    var drink: Drink

    var body: some View {
        let timestamp: String = DateTools.timeOfDay(datetime: drink.datetime)
        let descriptor = drink.beverage + ": " + String(drink.amount) + " mL"
        let reason = "context: " + drink.context

        VStack(spacing: 5) {
            TextRectangle(text: timestamp)
                .frame(alignment: .leading)
            TextRectangle(text: descriptor)
                .frame(alignment: .leading)
            TextRectangle(text: reason)
        }
    }
}

struct Legend: View {
    var body: some View {
        VStack(spacing: 5) {
            TextRectangle(text: "water", color: .cyan)
            TextRectangle(text: "tea", color: .yellow)
            TextRectangle(text: "coffee", color: .brown)
            TextRectangle(text: "juice", color: .orange)
            TextRectangle(text: "smoothie/shake", color: .pink)
            TextRectangle(text: "pop", color: .purple)
            TextRectangle(text: "alcoholic", color: .red)
            TextRectangle(text: "milk", color: .white)
            TextRectangle(text: "chocolate milk", color: .gray)
        }
    }
}

struct TextRectangle: View {
    var text: String
    var color: Color?
    
    var body: some View {
        ZStack {
            if let color {
                Rectangle()
                    .foregroundColor(color)
            }
            HStack {
                if color == nil {
                    Text(text)
                } else {
                    Text(text)
                        .foregroundStyle(.black)
                }
                Spacer()
            }
            .padding(2)
        }
        .frame(minHeight: 20)
    }
}

#Preview {
    DrinkDetailText(drink: Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "tea", beverage: "peppermint tea", contextCategory: "routine", context: "wake up"))
}
