//
//  PlayView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var settings: SettingsStore
    @Binding var status: Status
    @State private var showCancelGame = false
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "ИГРА…")
            Spacer()
            
            ClockView()
                .onReceive(self.settings.isGameOver) { isGameOver in
                    if isGameOver { self.stopGame() }
                    //                    if isGameOver {
                    //                        switch self.settings.missionMode {
                    //                        case .time:
                    //                            self.stopGame()
                    //                        case .qty:
                    //                            //  for this missionMode time countDown is irrelevant
                    //                            print("continue")
                    //                        }
                    //                    }
            }
            
            Spacer()
            
            Text("Игра: миссия")
            
            Spacer()
            
            HStack {
                GameButton(color: .clear, action: { self.showCancelGame = true }) {
                    Text("Стоп".uppercased())
                }
                .actionSheet(isPresented: $showCancelGame) {
                    ActionSheet(title: Text("Остановить миссию?".uppercased()),
                                message: Text("За отмену миссии начисляется штраф 10 баллов."),
                                buttons: [
                                    .default(Text("Продолжить миссию")),
                                    .destructive(Text("Принять штраф"),
                                                 action: { self.status = .setup })])
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
