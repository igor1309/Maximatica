//
//  OnboardingSection.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct OnboardingSection: View {
    @Environment(\.colorScheme) var colorScheme
    
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
                .foregroundColor(Color("onboargingImageColor"))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(NSLocalizedString(title, comment: ""))
                    .font(.headline)
                    .foregroundColor(Color("onboardingPrimaryColor"))
                
                Text(NSLocalizedString(text, comment: ""))
                    .font(.subheadline)
                    .foregroundColor(Color("onboardingSecondaryColor"))
                    .lineLimit(nil)
                
                if comment.isNotEmpty {
                    Text(NSLocalizedString(comment, comment: ""))
                        .font(.footnote)
                        .foregroundColor(Color("onboardingSecondaryColor"))
                        .opacity(0.6)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.top)
    }
}

struct OnboardingSection_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                LinearGradient(gradient:
                    Gradient(colors: [.systemTeal, .yellow]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .opacity(0.9)
                    .edgesIgnoringSafeArea(.all)
                
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
            
            ZStack {
                LinearGradient(gradient:
                    Gradient(colors: [.blue, .systemIndigo]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .opacity(0.9)
                    .edgesIgnoringSafeArea(.all)
                
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
            .environment(\.colorScheme, .dark)
        }
    }
}
