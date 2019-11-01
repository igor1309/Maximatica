//
//  GameButton.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import CoreHaptics

struct GameButton<Something: View>: View {
    var hapticsAvailable: Bool { CHHapticEngine.capabilitiesForHardware().supportsHaptics }
    
    let color: Color
    let action: () -> Void
    let content: Something
    
    init(color: Color = .blue, action: @escaping () -> Void, @ViewBuilder content: () -> Something) {
        self.color = color
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        Button(action: {
            if self.hapticsAvailable {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.action()
            }
        }) {
            content
                .font(color == .red ? .footnote : .headline)
                .foregroundColor(.white)
                .padding(color == .red ? 4 : 16)
                .padding(.horizontal)
                .background(Capsule(style: .circular)
                    .fill(color)
                    .opacity(color == .red ? 1 : 0.3))
                .background(Capsule(style: .circular)
                    .stroke()
                    .foregroundColor(.white))
        }
    }
}

struct GameButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            VStack(spacing: 16) {
                GameButton(action: {}) { Text("default color") }
                
                GameButton(color: .purple, action: {}) { Text("Purple".uppercased()) }
                
                GameButton(color: .red, action: {}) { Text("red") }
                
                Spacer()
            }
            .padding(.top).padding(.top)
        }
    }
}
