//
//  ClockView.swift
//  Maximatica
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
                        #if DEBUG
                        print("gameInterval \(self.settings.gameInterval)")
                        #endif
                    } else {
                        //  GAME OVER
                        //  MARK: HOW???
                        print("Game over")
                    }
                }
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
            .environmentObject(SettingsStore())
    }
}
