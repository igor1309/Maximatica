//
//  OnboardingSection.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct OnboardingSection: View {
    @Environment(\.colorScheme) var colorScheme
    
    var image: String
    var title: String
    var text: String
    var comment = ""
    
    var imageColor: Color { colorScheme == .dark ? .systemTeal : .white }
    var primatyColor: Color { colorScheme == .dark ? .systemYellow : Color(0x0E4CAB) }
    var secondaryColor: Color { colorScheme == .dark ? .primary : Color(0x2B5699) }

    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Image(systemName: image)
                .imageScale(.large)
                .offset(x: 0, y: 6)
                .frame(width: 44, alignment: .leading)
                .foregroundColor(imageColor)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(NSLocalizedString(title, comment: ""))
                    .font(.headline)
                    .foregroundColor(primatyColor)
                
                Text(NSLocalizedString(text, comment: ""))
                    .font(.subheadline)
                    .foregroundColor(secondaryColor)
                    .lineLimit(nil)
                
                if comment.isNotEmpty {
                    Text(NSLocalizedString(comment, comment: ""))
                        .font(.footnote)
                        .opacity(0.5)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.top)
    }
}

struct OnboardingSection_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [.systemTeal, .yellow]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
//            LinearGradient(gradient:
//                Gradient(colors: [.blue, .systemIndigo]),
//                           startPoint: .topLeading,
//                           endPoint: .bottomTrailing)
//                .opacity(0.9)
//                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                OnboardingSection(image: "star",
                                  title: "Это заголовок",
                                  text: "это поясняющий текст, не супердлинный, но всё же.",
                                  comment: "Это дополнительный комментарий к тексту. Может быть длинным или очень очень очень очень очень очень длинным.")
                OnboardingSection(image: "chart.bar",
                                  title: "Это заголовок",
                                  text: "это поясняющий текст, не супердлинный, но всё же.",
                                  comment: "Это дополнительный комментарий к тексту. Может быть длинным или очень очень очень очень очень очень длинным.")
                OnboardingSection(image: "chart.bar",
                                  title: "Это заголовок",
                                  text: "это поясняющий текст, не супердлинный, но всё же.")
                //            .border(Color.pink)
            }
            .padding()
        }
//        .environment(\.colorScheme, .dark)
    }
}
