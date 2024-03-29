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
        Text(userData.missionTimeCount.formatMinutesSeconds)
            .font(.subheadline)
            .foregroundColor(.white)
            .onReceive(timer) { timer in
                let elapsedTime = self.userData.missionStart.distance(to: timer)
//                print("elapsedTime: \(elapsedTime)")
                
                switch self.userData.missionMode {
                case .time:
                    self.userData.missionTimeCount = self.userData.missionTime - elapsedTime
                case .qty:
                    self.userData.missionTimeCount = elapsedTime
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
