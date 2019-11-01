//
//  SetupView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct SetupView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    @State private var selected = 5
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                GameStatusTitle(title: "Выбери миссию", withButtons: true)
                
                MissionOptionsSelector()
                    .padding(.horizontal)
            }
            
            Spacer()
            
            SelectableButton(title: "Вперемешку", selected: self.$selected, index: 5) { self.userData.arithmetic = nil }
            
            ForEach(Arithmetic.allCases.indices, id: \.self) { index in
                
                SelectableButton(title: Arithmetic.allCases[index].id, selected: self.$selected, index: index) { self.userData.arithmetic = Arithmetic.allCases[index] }
            }
            
            Spacer()
            
            Text("За прерывание миссии штраф 10 баллов.")
                .font(.subheadline)
                .foregroundColor(.white)
                .shadow(color: .systemIndigo, radius: 8)
            
            HStack {
                GameButton(color: .clear, action: { self.goBack() }) {
                    Text("Отмена".uppercased())
                }
                Spacer()
                
                GameButton(action: { self.runGame() }) {
                    Text("играть".uppercased())
                }
            }
            .padding(.horizontal)
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
    private func goBack() {
        userData.status = .score
    }
    
    private func runGame() {
        if hapticsAvailable {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
        //  MARK: додумать анимацию
        //  rotation?
        
        
        //  MARK: FINISH THE CODE
        
        
        switch userData.missionMode {
        case .time:
            userData.missionTimeCount = userData.missionTime
            userData.question = Question(arithmetic: userData.arithmetic, complexity: settings.сomplexity, ageGroup: settings.ageGroup)
            userData.questions = []
        case .qty:
            userData.missionTimeCount = 0
            userData.questions = QuestionGenerator(questionQty: userData.questionQty,
                                                   arithmetic: userData.arithmetic,
                                                   complexity: settings.сomplexity,
                                                   ageGroup: settings.ageGroup).questions
            userData.question = userData.questions[0]
        }
        
        
        userData.status = .play
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            SetupView()
                .environmentObject(UserData())
                .environmentObject(SettingsStore())
        }
    }
}
