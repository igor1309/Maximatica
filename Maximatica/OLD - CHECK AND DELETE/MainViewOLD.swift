//
//  MainViewOLD.swift
//  Maximatica
//
//  Created by Igor Malyarov on 31.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MainViewOLD: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var settings: SettingsStore
    @Binding var isRunning: Bool
    @State private var arithmetic: Arithmetic? = nil
    @State private var questions: [Question] = []
    
    var body: some View {
        VStack(spacing: 16) {
            if isRunning {
                QuestionView(questions: questions,
                             isRunning: $isRunning,
                             arithmetic: arithmetic)
            } else {
                ScrollView(.vertical) {
                    GameSelectionView(isRunning: $isRunning,
                                      arithmetic: $arithmetic,
                                      questions: $questions)
                }
            }
            Spacer()
        }
    }
}

struct MainViewOLD_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainViewOLD(isRunning: .constant(false))
            
            MainViewOLD(isRunning: .constant(true))
        }
    }
}
