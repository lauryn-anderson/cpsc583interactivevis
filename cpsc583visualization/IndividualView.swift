//
//  IndividualView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-16.
//

import SwiftUI
import SwiftData

struct IndividualView: View {
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
            ScrollView {
                VStack(spacing: 0) {
                    HStack {
                        DrinkStackView(drinks: drinks, day: day, targetDrink: $targetDrink)
                    }
                    Spacer()
                    HStack(spacing: 0) {
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
                    .frame(width: 550, height: 50, alignment: .bottom)
                }
            }
            DrinkDetailView(targetDrink: $targetDrink)
                .frame(alignment: .top)
        }
        .frame(height: 700)
    }
}

#Preview {
    IndividualView(person: .constant(.david), day: .constant(1))
        .modelContainer(previewContainer)
}
