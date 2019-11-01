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
        #if DEBUG
        if settings.gameInterval == 60 {
           settings.gameInterval = 10
        }
        #endif
        
        return Text(settings.gameInterval.formatMinuteSecond)
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
                        print("gameInterval \(self.settings.gameInterval)")
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
                .onReceive(self.settings.isGameOver) { isGameOver in
                    if isGameOver {
                    switch self.settings.missionMode {
                    case .time:
                        self.stopGame()
                    case .qty:
                        //  for this missionMode time countDown is irrelevant
                        print("continue")
                    }
                    }
            }
            
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
    
    func stopGame() {
        //  MARK: FINISH THIS
        
        //  MARK: JUST TESTINGGGG!!!!!
        self.status = .result
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
