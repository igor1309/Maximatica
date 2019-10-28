//
//  QuestionView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var settings: SettingsStore
    var arithmetic: Arithmetic
    
    var questions: [Question] { QuestionGenerator(questionQty: settings.questionQty,
                                                  arithmetic: arithmetic,
                                                  complexity: settings.сomplexity).questions }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(arithmetic: .addition)
            .environmentObject(SettingsStore())
    }
}
