//
//  ClockView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ClockView: View {
    @EnvironmentObject var userData: UserData
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        #if DEBUG
        if userData.gameInterval == 60 {
            userData.gameInterval = 10
        }
        #endif
        
        return Text(userData.gameInterval.formatMinuteSecond)
            .font(.subheadline)
            .foregroundColor(.white)
            .onReceive(timer) { _ in
                switch self.userData.missionMode {
                case .qty:
                    //  MARK: what here??????
                    self.userData.gameInterval += 1
                case .time:
                    if self.userData.gameInterval > 0 {
                        self.userData.gameInterval -= 1
                        #if DEBUG
                        print("gameInterval \(self.userData.gameInterval)")
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
            .environmentObject(UserData())
    }
}
