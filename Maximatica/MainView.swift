//
//  MainView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        if !settings.hasLaunchedBefor {
            return AnyView(OnboardingView(buttonTitle: "ok go")
                .transition(.scale)
                .accessibility(identifier: "onboardingView"))
        }
        else {
            switch userData.gameStatus {
            case.score: return AnyView(ScoreView().transition(.scale))
            case.setup: return AnyView(SetupView().transition(.scale))
            case.play: return AnyView(PlayView().transition(.scale))
            case.result: return AnyView(ResultView().transition(.scale))
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            MainView()
        }
        .environmentObject(UserData())
        .environmentObject(SettingsStore())
    }
}
