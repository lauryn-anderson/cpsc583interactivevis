//
//  ContentView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
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
        IndividualView(person: $person, day: $day)
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
}
