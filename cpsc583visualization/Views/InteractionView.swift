//
//  InteractionView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//
//  Embeds visualization in interactive UI
//

import SwiftUI
import SwiftData

struct InteractionView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var drinks: [Drink]
    @State var targetDrink: Drink? = nil
    @Binding var person: Drink.People
    @Binding var day: Int
    
    init(person: Binding<Drink.People>, day: Binding<Int>) {
        self._person = person
        self._day = day
        self.targetDrink = nil
        let name = Drink.getName(person: person.wrappedValue)
        
        // define dynamic query string during initialization
        _drinks = Query(
            filter: #Predicate<Drink> { drink in
                drink.person == name
            },
            sort: \Drink.datetime, order: .reverse
        )
    }
    
    var body: some View {
        HStack {
            // left-hand side is scrollable, with main visualization + person/day pickers
            ScrollView {
                VStack(spacing: 0) {
                    Spacer()
                        .frame(maxWidth: .infinity)
                    HStack {
                        DrinkChartView(drinks: drinks, day: day, targetDrink: $targetDrink)
                    }
                    HStack(spacing: 0) {
                        VStack {
                            List {
                                Picker("Person", selection: $person) {
                                    ForEach(Drink.People.allCases) { person in
                                        Text(person.rawValue.capitalized)
                                    }
                                }
                            }
                            List {
                                Picker("Day", selection: $day) {
                                    ForEach((0...6), id: \.self) { dayOption in
                                        Text(String(dayOption))
                                    }
                                }
                            }
                        }
                        Spacer()
                        MiniDrinkChartView(drinks: drinks)
                    }
                    .frame(width: Constants.chartWidth, height: Constants.pickerHeight)
                    Spacer()
                }
                .frame(height: Constants.chartHeight + Constants.pickerHeight)
            }
            // right-hand side has details on demand + colour legend
            SidebarView(targetDrink: $targetDrink)
                .frame(alignment: .top)
                .frame(height: Constants.chartHeight + Constants.pickerHeight)
        }
        .frame(height: Constants.chartHeight + Constants.pickerHeight)
    }
}

#Preview {
    InteractionView(person: .constant(.david), day: .constant(1))
        .modelContainer(previewContainer)
}
