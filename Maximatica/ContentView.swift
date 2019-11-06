//
//  ContentView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        Group {
            if settings.hasLaunchedBefor {
                ZStack {
                    MainGradient()
                    
                    MainView()
                        .environmentObject(UserData())
                        .environmentObject(SettingsStore())
                }
            } else {
                OnboardingView(buttonTitle: "Понятно, поехали")
                    .transition(.scale)
                    .environmentObject(UserData())
                    .environmentObject(SettingsStore())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
            .environmentObject(SettingsStore())
    }
}
