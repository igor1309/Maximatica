//
//  OnboardingView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [.systemTeal, .yellow]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                Text("body secondary")
                    .foregroundColor(.secondary)
                Text("largeTitle")
                    .font(.largeTitle)
                Text("title")
                    .font(.title)
                Text("headline")
                    .font(.headline)
                Text("callout")
                    .font(.callout)
                Text("subheadline")
                    .font(.subheadline)
                Text("footnote")
                    .font(.footnote)
                Text("caption")
                    .font(.caption)
                Spacer()
                SelectableButton(title: "Поехали", selected: .constant(0), index: 1) {  }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
