//
//  GameSelectionView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct GameSelectionView: View {
    @EnvironmentObject var settings: SettingsStore
    @Binding var isRunning: Bool
    @Binding var arithmetic: Arithmetic?
    @Binding var questions: [Question]
    
    var body: some View {
        Group {
            QuestionQtyPicker()
                .padding()
            
            ForEach(Arithmetic.allCases, id: \.self) { arithmetic in
                MathCardButton(arithmetic.id) { self.run(arithmetic) }
            }
            
            MathCardButton("Всё сразу", color: .yellow) { self.run(nil) }
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
        withAnimation() {
            questions = QuestionGenerator(questionQty: settings.questionQty,
                                          arithmetic: arithmetic ?? Arithmetic.allCases.randomElement()!,
                                          complexity: settings.сomplexity).questions
            isRunning = true
        }
    }
}

struct GameSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [.blue, .green]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                GameSelectionView(isRunning: .constant(true),
                                  arithmetic: .constant(.addition),
                                  questions: .constant([]))
            }
        }
        .environmentObject(SettingsStore())
    }
}
