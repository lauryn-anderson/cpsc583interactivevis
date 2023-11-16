//
//  ContentView.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//

import SwiftUI

struct ContentView: View {
    var drinks = importDrinkData()
    
    var body: some View {
        VStack {
            ForEach(drinks) { drink in
                DrinkView(drink: drink)
            }
        }
        .padding()
//        .onAppear(perform: convertCSVIntoArray)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
