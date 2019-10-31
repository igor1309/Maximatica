//
//  SetupView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    @EnvironmentObject var settings: SettingsStore
    @Binding var status: Status
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                GameStatusTitle(title: "Выбери миссию", withButtons: true)
                
                MissionOptionsSelector()
                    .padding(.horizontal)
            }

            Spacer()

            
            
            ForEach(Arithmetic.allCases, id: \.self) { arithmetic in
                MathCardButton(arithmetic.id) {  }
            }
            
            MathCardButton("Всё сразу", color: .yellow) {  }
            
            
            
            Spacer()
            
            HStack {
                GameButton(color: .clear, action: { self.status = .score }) {
                    Text("Отмена".uppercased())
                }
                Spacer()
                
                GameButton(action: { self.status = .play }) {
                    Text("играть".uppercased())
                }
            }
            .padding(.horizontal)
            .padding(.horizontal)

            Spacer()
        }
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            SetupView(status: .constant(.setup))
                .environmentObject(SettingsStore())
        }
    }
}
