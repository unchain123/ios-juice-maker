//
//  JuiceMakerApp.swift
//  JuiceMaker
//
//  Created by unchain on 2023/03/20.
//

import SwiftUI

@main
struct JuiceMakerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: ViewRouter(), service: JuiceService())
        }
    }
}
