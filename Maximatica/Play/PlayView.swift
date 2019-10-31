//
//  PlayView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    @Binding var status: Status
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "ИГРА…")
            Spacer()
            
            GameButton(color: .red, action: { self.status = .setup }) {
                Text("Отмена".uppercased())
            }
            
            Spacer()
            
            Text("Игра: миссия")
            
            Spacer()
            
            GameButton(action: { self.status = .result }) {
                Text("Дальше".uppercased())
            }
            
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
    }
}
