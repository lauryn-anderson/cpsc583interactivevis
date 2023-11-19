//
//  SidebarView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//
//  Sidebar that combines drink detail text
//  with color legend
//

import SwiftUI

struct SidebarView: View {
    @Binding var targetDrink: Drink?
    
    var body: some View {
        VStack {
            if let drink = targetDrink {
                DrinkDetailView(drink: drink)
                    .frame(alignment: .top)
            } else {
                TextRectangle(text: "Select a drink to see details")
                    .frame(alignment: .top)
            }
            Spacer()
            LegendView()
                .frame(height: 300)
        }
        .padding(10)
        .frame(width: 150, alignment: .topLeading)
        .background(.selection)
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
    SidebarView(targetDrink: .constant(Drink(person: "Lauryn", datetime: Date(), amount: 200, beverageCategory: "water", beverage: "water", contextCategory: "routine", context: "wake up")))
}
