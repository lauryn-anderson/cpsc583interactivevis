//
//  DrinkData.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//
//  Data model for drink data
//  Leverages SwiftData containers for queryability
//  Imports data from .csv file
//

import Foundation
import SwiftData

@Model
public class Drink {
    var person: String
    var datetime: Date
    var amount: Int
    var beverageCategory: String
    var beverage: String
    var contextCategory: String
    var context: String
    
    init(person: String, datetime: Date, amount: Int, beverageCategory: String, beverage: String, contextCategory: String, context: String) {
        self.person = person
        self.datetime = datetime
        self.amount = amount
        self.beverageCategory = beverageCategory
        self.beverage = beverage
        self.contextCategory = contextCategory
        self.context = context
    }
    
    enum People: String, CaseIterable, Identifiable {
        case david, eduardo, erica, justin, kevin, lauryn
        var id: Self { self }
    }
    
    static func getName(person: People) -> String {
        switch person {
        case .david:
            return "David"
        case .eduardo:
            return "Eduardo"
        case .erica:
            return "Erica"
        case .justin:
            return "Justin"
        case .kevin:
            return "Kevin"
        default:
            return "Lauryn"
        }
    }
}

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(
            for: Drink.self,
            configurations: ModelConfiguration(isStoredInMemoryOnly: true)
        )
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<Drink>()).isEmpty {
            let drinks = importDrinkData()
            drinks.forEach { container.mainContext.insert($0) }
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

public func importDrinkData() -> [Drink] {
    var drinks = [Drink]()

    // locate the file you want to use
    guard let filepath = Bundle.main.path(forResource: "beverages", ofType: "csv") else {
        return drinks
    }

    // convert that file into one long string
    var data = ""
    do {
        data = try String(contentsOfFile: filepath)
    } catch {
        print(error)
        return drinks
    }

    // now split that string into an array of "rows" of data.  Each row is a string.
    var rows = data.components(separatedBy: "\n")

    // if you have a header row, remove it here
    rows.removeFirst()
    
    // now loop around each row, and split it into each of its columns
    for row in rows {
        let columns = row.components(separatedBy: ",")

        // check that we have enough columns
        if columns.count == 7 {
            let name = columns[0]
            let datetime = DateTools.parseDate(date: columns[1])
            let amount = Int(columns[2]) ?? 0
            let beverageCategory = columns[3]
            let beverage = columns[4]
            let contextCategory = columns[5]
            let context = columns[6]

            let drink = Drink(person: name, datetime: datetime, amount: amount, beverageCategory: beverageCategory, beverage: beverage, contextCategory: contextCategory, context: context)
            drinks.append(drink)
        }
    }
    return drinks
}

public func filterDrinksByDay(drinks: [Drink], day: Int) -> [Drink] {
    // apparently Swift doesn't do list comprehensions like Python
    var filteredDrinks: [Drink] = []
    for drink in drinks {
        if (DateTools.isOn(day: day, date: drink.datetime)) {
            filteredDrinks.append(drink)
        }
    }
    return filteredDrinks
}

public func getTotalDrinkAmount(drinks: [Drink]) -> Int {
    var total = 0
    for drink in drinks {
        total += drink.amount
    }
    return total
}
