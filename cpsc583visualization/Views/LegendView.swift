//
//  LegendView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-18.
//
//  Legend that assigns a different color for each beverage category
//

import SwiftUI

struct LegendView: View {
    let beverages = ["water", "tea", "coffee", "juice", "smoothie/shake", "pop", "alcoholic", "milk", "chocolate milk"]
    
    var body: some View {
        VStack(spacing: 5) {
            ForEach(beverages, id: \.self) { beverage in
                TextRectangle(text: beverage, color: LegendView.beverageColor(beverage: beverage))
            }
        }
    }
    
    static func beverageColor(beverage: String) -> Color {
        switch beverage {
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
        case "alcoholic":
            return Color.red
        default:
            return Color.gray
        }
    }
}

#Preview {
    LegendView()
}
