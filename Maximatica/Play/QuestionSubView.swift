//
//  QuestionSubView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct QuestionSubView: View {
    var question: Question?
    var answer: String
    
    var body: some View {
        VStack {
            if question != nil {
                Text("\(question!.left) \(question!.sign) \(question!.right) = \(answer)")
                .font(Font.system(size: 64))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct QuestionSubView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSubView(question: Question(arithmetic: .addition, complexity: .basic, ageGroup: .sevenToNine), answer: "")
    }
}
