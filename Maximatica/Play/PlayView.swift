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
    
    @State private var showAbortAlert = false
    @State private var showSolveTheProblem = false
    
    var progress: Double {
        withAnimation {
            switch userData.missionMode {
            case .time:
                return Double(userData.missionTimeCount) / Double(userData.missionTime)
            case .qty:
                return Double(count) / Double(userData.questionQty)
            }
        }
    }
    
    var abortAndNextButtons: some View {
        HStack {
            GameButton(color: .clear, action: { self.showAbortAlert = true }) {
                Text("Стоп".uppercased())
            }
            .actionSheet(isPresented: $showAbortAlert) {
                ActionSheet(title: Text("Остановить миссию?".uppercased()),
                            message: Text("За отмену миссии начисляется штраф 10 баллов."),
                            buttons: [
                                .default(Text("Продолжить миссию")),
                                .destructive(Text("Принять штраф"),
                                             action: { self.abortMission() })])
            }
            
            Spacer()
            
            GameButton(action: { self.nextStep() }) {
                Text("Дальше".uppercased())
            }
        }
        .padding(.horizontal)
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    var body: some View {
        VStack(spacing: 32) {
            ZStack {
                HStack {
                    ProgressView(progress: Double(progress))
                    ClockView()
                        .onReceive(self.userData.$missionTimeCount) {
                            if $0 <= 0 && self.userData.missionMode == .time {
                                self.stopMission()
                            }}
                }
                .frame(height: 56)
                
                if showSolveTheProblem {
                    SolveTheProblemBanner().frame(height: 56)
                }
            }
            .padding(.top)
            
            Spacer()
            
            QuestionSubView(question: userData.question, answer: answer)
            
            NumberPad(text: $answer)
            
            Spacer()
            
            abortAndNextButtons
            
            Spacer()
        }
        .frame(maxWidth: 600, maxHeight: 900)
    }
    
    func nextStep() {
        //  no answer is not accepted
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
        
        
        //  записать правильный ли ответ
        if Int(answer) == userData.question.result { correctAnswerCount += 1 }
        
        //  следующий вопрос
        if count < userData.questionQty - 1 || userData.missionMode == .time {
            if hapticsAvailable {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            //  next question
            answer = ""
            withAnimation {
                count += 1
                
                //  сгенерировать следующий вопрос
                userData.nextQuestion()
            }
        } else {
            stopMission()
        }
    }
    
    func stopMission() {
        //  MARK: FINISH THIS
        
        
        if hapticsAvailable {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
        //  stop timer
        //  check result
        
        //  save result
        saveHistory()
        //  show result
        userData.gameStatus = .result
    }
    
    func abortMission() {
        //  MARK: FINISH THIS
        
        
        if hapticsAvailable {
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }
        
        //  MARK: Начислить штраф
        
        
        //  закончить миссию
        stopMission()
    }
    
    func saveHistory() {
        print("saveHistory CALLED")
        //  MARK: FINISH THIS
        
        let timeSpent: TimeInterval
        switch userData.missionMode {
        case .time:
            timeSpent = userData.missionTime - userData.missionTimeCount
        case .qty:
            timeSpent = userData.missionTimeCount
        }
        
        userData.history.add(TestResult(dateTime: Date(),
                                        totalAnswers: Double(count + 1),
                                        correctAnswers: Double(correctAnswerCount),
                                        timeSpent: timeSpent,
                                        ageGroup: userData.ageGroup,
                                        complexity: userData.complexity,
                                        arithmetic: userData.arithmetic))
        
        //  MARK: как записать штраф?
        //        как начислить и записать баллы?
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
