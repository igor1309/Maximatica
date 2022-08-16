//
//  MaximaticaApp.swift
//  Maximatica
//
//  Created by Igor Malyarov on 16.08.2022.
//  Copyright © 2022 Igor Malyarov. All rights reserved.
//

import SwiftUI

@main
struct NewIn14App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
                .environmentObject(SettingsStore())
        }
    }
}
