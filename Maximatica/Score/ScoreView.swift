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
                .opacity(0)
        }
    }
}


struct ScoreView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    let smallScreen = UIScreen.main.bounds.height < 700
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "Maximatica", withButtons: true)
            
            VStack(spacing: 0) {
                Text(userData.history.score.formattedGrouped)
                    .font(Font.system(size: 88))
                    .fontWeight(.heavy)
                    .accessibility(identifier: "scoreView")
                
                Text("Баллов всего".uppercased())
                    .font(.subheadline)
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            
                        Spacer()
            
            Group {
                VStack(spacing: 0) {
                    Text("За последние 7 дней".uppercased())
                        .font(.subheadline)
                    
                    HStack {
                        Spacer()
                        DashboardElement(title: "баллов".uppercased(),
                                         amount: userData.history.scoreForLastWeek,
                                         image: "sum")
                        Spacer()
                        DashboardElement(title: "Минут".uppercased(),
                                         amount: userData.history.timeSpentForLastWeek,
                                         image: "stopwatch")
                        Spacer()
                    }
                }
            }
            .foregroundColor(.yellow)
                .opacity(0.9)
            
            Spacer()
            
            GameButton(action: { self.userData.gameStatus = .setup }) {
                //  выбрать миссию
                Text("Играть!".uppercased())
            }
            
            Spacer()
        }
        .frame(maxWidth: 600, maxHeight: 900)
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
