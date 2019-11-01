//
//  MainView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var settings: SettingsStore
    @State var status: Status = .score
    
    var body: some View {
        VStack(spacing: 32) {
            if status == .score { ScoreView(status: $status) }
            
            if status == .setup { SetupView(status: $status) }
            
            if status == .play { PlayView(status: $status) }
            
            if status == .result { ResultView(status: $status) }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            MainView()
        }
        .environmentObject(SettingsStore())
    }
}
