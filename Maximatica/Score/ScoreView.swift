//
//  ScoreView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ScoreView: View {
    @Binding var status: Status
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "Maximatica", withButtons: true)
            
            Spacer()
            
            Text("статус игрока")
            
            Spacer()
            
            GameButton(action: { self.status = .setup }) {
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
            
            ScoreView(status: .constant(.score))
        }
    }
}
