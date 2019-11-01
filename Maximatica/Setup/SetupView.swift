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
    @State var arithmetic: Arithmetic?
    @State private var selected = 5
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                GameStatusTitle(title: "Выбери миссию", withButtons: true)
                
                MissionOptionsSelector()
                    .padding(.horizontal)
            }
            
            Spacer()
            
            SelectableButton(title: "Вперемешку", selected: self.$selected, index: 5) { self.arithmetic = nil }
            
            ForEach(Arithmetic.allCases.indices, id: \.self) { index in
                
                SelectableButton(title: Arithmetic.allCases[index].id, selected: self.$selected, index: index) { self.arithmetic = Arithmetic.allCases[index] }
            }

            Spacer()
            
            HStack {
                GameButton(color: .clear, action: { self.status = .score }) {
                    Text("Отмена".uppercased())
                }
                Spacer()
                
                GameButton(action: {
                    //  MARK: FINISH THE CODE
                    self.status = .play
                }) {
                    Text("играть".uppercased())
                }
            }
            .padding(.horizontal)
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
    private func run(_ arithmetic: Arithmetic?) {
        if hapticsAvailable {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        self.arithmetic = arithmetic

        //  MARK: додумать анимацию
        //  rotation?
        
        
        //  MARK: FINISH THE CODE
        
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
