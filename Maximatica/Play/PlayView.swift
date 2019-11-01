//
//  PlayView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ClockView: View {
    @EnvironmentObject var settings: SettingsStore
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(settings.gameInterval.formatMinuteSecond)
            .font(.subheadline)
            .foregroundColor(.white)
            .onReceive(timer) { _ in
                switch self.settings.missionMode {
                case .qty:
                    //  MARK: what here??????
                    self.settings.gameInterval += 1
                case .time:
                    if self.settings.gameInterval > 0 {
                        self.settings.gameInterval -= 1
                    } else {
                        //  GAME OVER
                        //  MARK: HOW???
                        print("Game over")
                    }
                }
        }
    }
}


struct PlayView: View {
    @EnvironmentObject var settings: SettingsStore
    @Binding var status: Status
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "ИГРА…")
            Spacer()
            
            ClockView()
            
            Spacer()
            
            Text("Игра: миссия")
            
            Spacer()
            
            HStack {
                GameButton(color: .clear, action: { self.status = .setup }) {
                    Text("Отмена".uppercased())
                }
                Spacer()
                
                GameButton(action: { self.status = .result }) {
                    Text("Дальше".uppercased())
                }
            }
            .padding(.horizontal)
            .padding(.horizontal)
            
            Spacer()
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            PlayView(status: .constant(.play))
        }
        .environmentObject(SettingsStore())
    }
}
