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
        VStack(spacing: 32) {
            if userData.status == .score { ScoreView() }
            
            if userData.status == .setup { SetupView() }
            
            if userData.status == .play { PlayView() }
            
            if userData.status == .result { ResultView() }
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
