//
//  ResultView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var userData: UserData
    
    @State private var showProgress = false
    
    //  в реальности userData.history.results[0] не может быть пустым — на этот экран попадаем после прохождения теста
    //  но при отладке может быть пустой массив результатов - поэтому dummy data
    var result: TestResult {
        userData.history.isListEmpty
        ? TestResult(
            dateTime: Date(),
            totalAnswers: 10,
            correctAnswers: 9,
            timeSpent: 14,
            ageGroup: .sevenToNine,
            complexity: .basic)
        : userData.history.results[0]
    }
    
    var body: some View {
        VStack() {
            GameStatusTitle(title: "Результат")
            VStack(alignment: .leading, spacing: 3) {
                Group {
                    HStack {
                        Text("Баллы")
                            .bold()
                        Spacer()
                        Text(Score(testResult: result).finalScore.formattedGrouped)
                            .bold()
                    }
                    .font(.largeTitle)
                    
                    HStack {
                        Text("Верно")
                        Spacer()
                        Text("\(result.correctAnswers.formattedGrouped) из \(result.totalAnswers.formattedGrouped)").bold()
                    }
                    HStack {
                        if showProgress {
                            ProgressBar(progress: result.correctAnswersShare, width: 240, height: 8)
                                .transition(AnyTransition.opacity.combined(with: .scale).animation(.easeOut(duration: 1.20)))
                        }
                        Spacer()
                        Text("\(result.correctAnswersShare.formattedPercentage) ")
                    }
                    .font(.headline)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            self.showProgress = true
                        }
                    }
                    
                    HStack {
                        Text("Время")
                        Spacer()
                        Text(result.timeSpent.formatMinutesSeconds)
                    }
                }
                .foregroundColor(.white)
                
                Group {
                    Group {
                        HStack {
                            Text("Ответов в минуту")
                            Spacer()
                            Text(result.velocity.formattedGrouped)
                        }
                        HStack {
                            Text("Секунд на ответ")
                            Spacer()
                            Text(result.pace.formattedGroupedWith1Decimal)
                        }
                    }
                    .foregroundColor(.white)
                    .opacity(0.7)
                    
                    Group {
                        HStack {
                            Text("Арифметика")
                            Spacer()
                            Text("\(result.arithmetic?.id ?? "все")")
                        }
                        .padding(.top)
                        
                        Text("\(result.complexity.id), ")
                        + Text("\(result.ageGroup.id)")
                        
                        Text(result.dateTime.dateAndTimetoString())
                            .font(.subheadline)
                            .padding(.top)
                    }
                    .foregroundColor(.systemTeal)
                }
                .font(.headline)
            }
            .font(.title)
            .padding(.horizontal)
            .padding()
            
            Spacer()
            
            GameButton(action: { self.userData.gameStatus = .score }) {
                Text("Ok".uppercased())
            }
            
            Spacer()
        }
        .frame(maxWidth: 600, maxHeight: 900)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            ResultView()
                .environmentObject(UserData())
        }
    }
}
