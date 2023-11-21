//
//  ContentView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//
//  Base view that defines global variables and constants
//  and hosts interactive visualization
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var drinks: [Drink]
    @Environment(\.modelContext) private var modelContext
    @State var targetDrink: Drink? = nil
    @State private var person: Drink.People = .eduardo
    @State private var day: Int = 0

    var body: some View {
        InteractionView(person: $person, day: $day)
    }
}

struct Constants {
    static let UIHeight: CGFloat = 650
    static let chartHeight: CGFloat = 600
    static let legendHeight: CGFloat = 300
    static let chartWidth: CGFloat = 590
    static let xAxisWidth: CGFloat = 500
    static let bottleWidth: CGFloat = 50
    static let sidebarWidth: CGFloat = 150
    static let markWidth: CGFloat = 5
    static let markCorners = CGSize(width: 2, height: 2)
    static let millilitreScaleFactor: CGFloat = 10
    static let millilitresInUnit = 250
    static let referenceLineIndex = 8
    static let minutesInDay = 24 * 60
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
