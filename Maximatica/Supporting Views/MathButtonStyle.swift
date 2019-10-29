//
//  MathButtonStyle.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MathButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
//            .opacity(configuration.isPressed ? 0.4 : 1)
    }
}

struct MathButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            Text("Text as button")
                .buttonStyle(MathButtonStyle())
            
            Button(action: {}) {
                Text("Test MathButtonStyle")
                .buttonStyle(MathButtonStyle())
            }
        }
    }
}
