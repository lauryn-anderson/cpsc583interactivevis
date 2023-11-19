//
//  cpsc583visualizationApp.swift
//  cpsc583visualization
//
//  Created by Lauryn Anderson on 2023-11-15.
//
//  Main file to execute application with the appropriate data source
//

import SwiftUI

@main
struct cpsc583visualizationApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(previewContainer)
    }
}
