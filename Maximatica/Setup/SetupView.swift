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
            
            SelectableButton(title: "Вперемешку", selected: self.$selected, index: 5) { self.userData.mission.arithmetic = nil }
            
            ForEach(Arithmetic.allCases.indices, id: \.self) { index in
                
                SelectableButton(title: Arithmetic.allCases[index].id, selected: self.$selected, index: index) { self.userData.mission.arithmetic = Arithmetic.allCases[index] }
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
        
        
        switch userData.mission.missionMode {
        case .time:
            userData.missionTimeCount = userData.mission.missionTime
            userData.mission.question = Question(arithmetic: userData.mission.arithmetic, complexity: settings.сomplexity, ageGroup: settings.ageGroup)
            userData.mission.questions = []
        case .qty:
            userData.missionTimeCount = 0
            userData.mission.questions = QuestionGenerator(questionQty: userData.mission.questionQty,
                                                   arithmetic: userData.mission.arithmetic,
                                                   complexity: settings.сomplexity,
                                                   ageGroup: settings.ageGroup).questions
            userData.mission.question = userData.mission.questions[0]
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
