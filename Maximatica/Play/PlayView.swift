//
//  PlayView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    @State private var answer = ""
    @State private var count = 0
    @State private var correctAnswerCount = 0
    @State private var showCancelGame = false
    @State private var showSolveTheProblem = false
    
    var progress: Double {
        withAnimation {
            switch userData.mission.missionMode {
            case .time:
                return Double(userData.missionTimeCount) / Double(userData.mission.missionTime)
            case .qty:
                return Double(count) / Double(userData.mission.questionQty)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 32) {
            ZStack {
                HStack {
                    ProgressView(progress: Double(progress))
                    ClockView()
                        .onReceive(self.userData.isGameOver) { isGameOver in
                            if isGameOver { self.stopGame() }
                    }
                }
                .frame(height: 56)
                
                if showSolveTheProblem {
                    SolveTheProblemBanner().frame(height: 56)
                }
            }
            .padding(.top)
            
            Spacer()
            
            QuestionSubView(question: userData.mission.question, answer: answer)
            
            NumberPad(text: $answer)
            
            Spacer()
            
            HStack {
                GameButton(color: .clear, action: { self.showCancelGame = true }) {
                    Text("Стоп".uppercased())
                }
                .actionSheet(isPresented: $showCancelGame) {
                    ActionSheet(title: Text("Остановить миссию?".uppercased()),
                                message: Text("За отмену миссии начисляется штраф 10 баллов."),
                                buttons: [
                                    .default(Text("Продолжить миссию")),
                                    .destructive(Text("Принять штраф"),
                                                 action: { self.abort() })])
                }
                
                Spacer()
                
                GameButton(action: { self.nextStep() }) {
                    Text("Дальше".uppercased())
                }
            }
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.bottom)
            
            //            Spacer()
        }
    }
    
    func abort() {
        //  MARK: FINISH THIS
        
        //  MARK: Начислить штраф
        
        userData.status = .setup
    }
    
    func nextStep() {
        
        if answer.isEmpty {
            if hapticsAvailable {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.error)
            }
            withAnimation(.easeIn(duration: 0.3)) {
                showSolveTheProblem = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                self.showSolveTheProblem = false
            }
            return
        }
        
        // записать правильный ли ответ
        switch userData.mission.missionMode {
        case .time:
            if Int(answer) == userData.mission.question?.result { correctAnswerCount += 1 }
        case .qty:
            if Int(answer) == userData.mission.questions[count].result { correctAnswerCount += 1 }
        }
        
        
        
        if count < userData.mission.questionQty - 1 {
            if hapticsAvailable {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            //  next question
            answer = ""
            withAnimation {
                count += 1
                
                switch userData.mission.missionMode {
                case .time:
                    userData.mission.question = Question(arithmetic: userData.mission.arithmetic, complexity: settings.сomplexity, ageGroup: settings.ageGroup)
                case .qty:
                    userData.mission.question = userData.mission.questions[count]
                }
                
            }
            return
        }
        
        stopGame()
        
    }
    
    func saveHistory() {
    }
    
    func stopGame() {
        //  MARK: FINISH THIS
        
        //  MARK: JUST TESTINGGGG!!!!!
        userData.status = .result
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            PlayView()
        }
        .environmentObject(UserData())
        .environmentObject(SettingsStore())
    }
}
