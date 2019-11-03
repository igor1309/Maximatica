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
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 0) {
            Image(systemName: image)
                .imageScale(.large)
                .offset(x: 0, y: 6)
                .frame(width: 40, alignment: .leading)
//                .foregroundColor(.purple)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                Text(text)
                    .font(.subheadline)
                    .lineLimit(nil)
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.top)
    }
}

struct OnboardingSection_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSection(image: "chart.bar",
                          title: "Это заголовок",
                          text: "это поясняющий текст, не супердлинный, но всё же.")
    }
}
