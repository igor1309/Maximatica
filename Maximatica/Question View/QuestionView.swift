//
//  QuestionView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct QuestionSubView: View {
    var question: Question
    var answer: String
    
    var body: some View {
        Text("\(question.left) \(question.sign) \(question.right) = \(answer)")
            .font(Font.system(size: 64))
            .fontWeight(.bold)
            .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
            .padding()
    }
}


struct QuestionView: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    
    var questions: [Question]
    
    @Binding var isRunning: Bool
    
    var arithmetic: Arithmetic?
    
    @State private var correctAnswerCount = 0
    @State private var answer = ""
    @State private var showSolveTheProblem = false
    @State private var showResult = false
    @State private var progress = 0
    //  MARK: как засечь время??
    @State private var timer: TimeInterval = 0
    
    var body: some View {
        VStack(spacing: 16) {
            if showResult {
                ResultViewOLD(isRunning: $isRunning)
            } else {
                if showSolveTheProblem {
                    SolveTheProblemBanner()
                        .frame(minHeight: 85)
                } else {
                    HStack {
                        Button(action: {
                            self.stop()
                        }) {
                            Text("Стоп".uppercased())
                                .fontWeight(.black)
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(6)
                                .padding(.horizontal, 6)
                                .background(Capsule(style: .circular)
                                    //                                    .stroke()
                                    .foregroundColor(.red))
                        }
                        Spacer()
                        
                        if !settings.hideTimer {
                            TimerView(timer: $timer)
                            Spacer()
                        }
                        
                        ProgressView(progress: Double(progress) / Double(userData.questionQty))
                    }
                    .padding(.horizontal)
                    .frame(minHeight: 85)
                }
                
                QuestionSubView(question: questions[progress], answer: answer)
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        //  MARK: action...
                        self.nextQuestion()
                    }) {
                        Text("Дальше".uppercased())
                            .fontWeight(.heavy)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding().padding(.horizontal)
                            .background(Capsule(style: .circular).foregroundColor(.blue))
                    }
                }
                .padding()
                
                NumberPad(text: $answer)
                    .padding(.top).padding(.top)
            }
        }
    }
    
    func stop() {
        if hapticsAvailable {
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
        }
        
        //  stop timer
        //  check result
        
        if progress == 0 {
            //  СТОП тапнут без решения задач вообще
            self.isRunning = false
        } else {
            //  save result
            saveHistory()
            //  show result
            showResult = true
        }
    }
    
    func saveHistory() {
        userData.history.add(TestResult(dateTime: Date(),
                                        totalAnswers: Double(progress + 1),
                                        correctAnswers: Double(correctAnswerCount),
                                        timeSpent: timer,
                                        ageGroup: settings.ageGroup,
                                        complexity: settings.сomplexity,
                                        arithmetic: arithmetic))
    }
    
    func nextQuestion() {
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
        
        // записать ответ
        if Int(answer) == questions[progress].result { correctAnswerCount += 1 }
        
        if progress < userData.questionQty - 1 {
            if hapticsAvailable {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            //  next question
            answer = ""
            withAnimation { progress += 1 }
            return
        }
        
        stop()
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                MainGradient()
                
                QuestionView(questions: QuestionGenerator(questionQty: 2,
                                                          arithmetic: .addition,
                                                          complexity: .basic,
                                                          ageGroup: .sevenToNine).questions,
                             isRunning: .constant(true),
                             arithmetic: nil)
            }
        }
        .environmentObject(UserData())
        .environmentObject(SettingsStore())
    }
}
