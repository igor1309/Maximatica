//
//  ResultView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var userData: UserData
    @Binding var isRunning: Bool
    
    var result: TestResult { userData.history.results[0] }
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 3) {
                Group {
                Text("Правильно ")
                + Text("\(result.correctAnswers.formattedGrouped) из \(result.totalAnswers.formattedGrouped) ")
                    
                Text("\(result.correctAnswersShare.formattedPercentage) ").bold()
                    
                Text("время \(result.timeSpent.formatMinuteSecond)")
                }
                .foregroundColor(.white)
                
                Group {
                    Text("\(result.velocity.formattedGrouped) ответов в минуту")
                    Text("(\(result.pace.formattedGrouped) сек. на ответ)")
                }
                .foregroundColor(.white)
                .opacity(0.7)
                
                Group {
                    Text("Арифметика: \(result.arithmetic?.id ?? "все"), ")
                        .padding(.top)
                    Text("\(result.complexity.id), ")
                    + Text("\(result.ageGroup.id)")
                    Text(result.dateTime.dateAndTimetoString())
                    //                        .font(.subheadline)
                }
                .foregroundColor(.systemTeal)
            }
            .font(.title)
            .padding()
            
            Button(action: {
                if hapticsAvailable {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                }
                
                self.isRunning = false
            }) {
                Text("OK")
                    .fontWeight(.heavy)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding().padding(.horizontal)
                    .background(Capsule(style: .circular)
                        .stroke().foregroundColor(.systemGreen))
                
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
            LinearGradient(gradient:
                Gradient(colors: [.systemBlue, .systemGreen]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                ResultView(isRunning: .constant(true))
            }
        }
        .environmentObject(UserData())
        //        .environment(\.colorScheme, .dark)
    }
}
