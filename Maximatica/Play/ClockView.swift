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
    let timer = Timer.publish(every: 1, tolerance: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(userData.missionTimeCount.formatMinuteSecond)
            .font(.subheadline)
            .foregroundColor(.white)
            .onReceive(timer) { timer in
                print(timer)
                
                switch self.userData.missionMode {
                case .time:
                    if self.userData.missionTimeCount > 0 {
                        self.userData.missionTimeCount -= 1
//                        #if DEBUG
//                        print("missionTimeCount \(self.userData.missionTimeCount)")
//                        #endif
                    } else {
                        //  GAME OVER
                        //  MARK: HOW???
                        print("Game over")
                    }
                case .qty:
                    //  MARK: what here??????
                    self.userData.missionTimeCount += 1
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
