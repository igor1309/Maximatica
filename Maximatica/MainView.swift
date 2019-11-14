//
//  MainView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct MainView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        if !settings.hasLaunchedBefor {
            return OnboardingView(buttonTitle: "ok go")
                .transition(.scale)
                .accessibility(identifier: "onboardingView")
                .typeErased
        }
        else {
            switch userData.gameStatus {
            case.score:
                return ScoreView().transition(.scale).typeErased
            case.setup:
                return SetupView().transition(.scale).typeErased
            case.play:
                return PlayView().transition(.scale).typeErased
            case.result:
                return ResultView().transition(.scale).typeErased
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
