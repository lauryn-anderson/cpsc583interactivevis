//
//  ContentView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//
//  Base view that defines global variables and hosts vis

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

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
