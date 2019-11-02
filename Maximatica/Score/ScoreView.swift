//
//  ScoreView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "Maximatica", withButtons: true)
            
//            Spacer()
            
            VStack(spacing: 0) {
                Text(userData.score.formattedGrouped)
                    .font(Font.system(size: 80))
                    .fontWeight(.heavy)
                
                Text("Количество баллов".uppercased())
                    .font(.subheadline)
                    .opacity(0.6)
            }
            .foregroundColor(.white)
            
            BarChartView(bars: userData.scores.reversed())
            
            Spacer()
            
            GameButton(action: { self.userData.gameStatus = .setup }) {
                //  выбрать миссию
                Text("Хочу еще!".uppercased())
            }
            
            Spacer()
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            ScoreView()
        }
        .environmentObject(UserData())
        .environmentObject(SettingsStore())
    }
}
