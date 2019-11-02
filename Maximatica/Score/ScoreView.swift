//
//  ScoreView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct DashboardElement: View {
    var title: String
    var amount: Double
    var image: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: image)
                    .imageScale(.large)
                Text(amount.formattedGrouped)
                    .font(Font.system(size: 52))
                    .fontWeight(.bold)
            }
            Text(title.uppercased())
                .font(.caption)
                .opacity(0.7)
        }
        .foregroundColor(.white)
    }
}


struct ScoreView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    let smallScreen = UIScreen.main.bounds.height < 700
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "Maximatica", withButtons: true)
            
            //                        Spacer()
            
            VStack(spacing: 0) {
                Text(userData.history.score.formattedGrouped)
                    .font(Font.system(size: 80))
                    .fontWeight(.heavy)
                
                Text("Баллов всего".uppercased())
                    .font(.subheadline)
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            
            //            Spacer()
            
            VStack(spacing: 0) {
                Text("За неделю".uppercased())
                    .font(.subheadline)
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    DashboardElement(title: "баллов".uppercased(),
                                     amount: userData.history.scoreForLastWeek,
                                     image: "metronome")
                    Spacer()
                    DashboardElement(title: "Минут".uppercased(),
                                     amount: userData.history.timeSpentForLastWeek,
                                     image: "stopwatch")
                    Spacer()
                }
            }.opacity(0.75)
            
            //            if !smallScreen {
            //                BarChartView(bars: userData.history.scoresForLastWeek)
            //                //                .scaleEffect(0.5).frame(width: 200, height: 130)
            //            }
            
            Spacer()
            
            GameButton(action: { self.userData.gameStatus = .setup }) {
                //  выбрать миссию
                Text((userData.history.score == 0 ? "Хочу баллы!" : "Хочу еще!").uppercased())
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
