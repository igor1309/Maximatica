//
//  OnboardingSection.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct OnboardingSection: View {
    var image: String
    var title: String
    var text: String
    var comment = ""
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Image(systemName: image)
                .imageScale(.large)
                .offset(x: 0, y: 6)
                .frame(width: 44, alignment: .leading)
            //                .foregroundColor(.purple)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.headline)
                Text(text)
                    .font(.subheadline)
                    .lineLimit(nil)
                if comment.isNotEmpty {
                    Text(comment)
                        .font(.footnote)
                        .opacity(0.4)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.top)
    }
}

struct OnboardingSection_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            OnboardingSection(image: "chart.bar",
                              title: "Это заголовок",
                              text: "это поясняющий текст, не супердлинный, но всё же.",
                              comment: "Это дополнительный комментарий к тексту. Может быть длинным или очень очень очень очень очень очень длинным.")
            OnboardingSection(image: "chart.bar",
                              title: "Это заголовок",
                              text: "это поясняющий текст, не супердлинный, но всё же.")
            .border(Color.pink)
        }
    }
}
