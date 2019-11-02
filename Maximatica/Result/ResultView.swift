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
    
    //  в реальности userData.history.results[0] не может быть пустым — на этот экран попадаем после прохождения теста
    //  но при отладке может быть пустой массив результатов - поэтому dummy data
    var result: TestResult { userData.history.isListEmpty ? TestResult(dateTime: Date(),
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
                    Text("Правильно ")
                        + Text("\(result.correctAnswers.formattedGrouped) из \(result.totalAnswers.formattedGrouped) ").bold()
                    
                    Text("\(result.correctAnswersShare.formattedPercentage) ")
                    
                    Text("время \(result.timeSpent.formatMinuteSecond)")
                }
                .foregroundColor(.white)
                
                Group {
                    Text("\(result.velocity.formattedGrouped) ответов в минуту")
                    Text("(\(result.pace.formattedGroupedWith1Decimal) сек. на ответ)")
                }
                .foregroundColor(.white)
                .opacity(0.7)
                
                Group {
                    Text("Арифметика: \(result.arithmetic?.id ?? "все")")
                        .padding(.top)
                    Text("\(result.complexity.id), ")
                        + Text("\(result.ageGroup.id)")
                    Text(result.dateTime.dateAndTimetoString())
                        .font(.subheadline)
                        .padding(.top)
                }
                .foregroundColor(.systemTeal)
            }
            .font(.title)
            .padding(.horizontal)
            .padding()
            
            Spacer()
            
            GameButton(action: { self.userData.status = .score }) {
                Text("Ok".uppercased())
            }
            
            Spacer()
        }
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
