//
//  SelectableButton.swift
//  Maximatica
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import CoreHaptics

struct SelectableButton: View {
    var title: String
    @Binding var selected: Int
    var index: Int
    var action: () -> Void
    
    var hapticsAvailable: Bool { CHHapticEngine.capabilitiesForHardware().supportsHaptics }
    
    var body: some View {
        return Button(action: {
            if self.hapticsAvailable {
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.selected = self.index
                self.action()
            }
        }) {
            Text(verbatim: title.uppercased())
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 200, height: 24)
                .padding()
                .padding(.horizontal)
                .background(Color.white.opacity(selected == index ? 0.3 : 0))
                .cornerRadius(16)
                .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke()
                    .foregroundColor(.white))
        }
    }
}

struct SelectableButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SelectableButton(title: "selected", selected: .constant(2), index: 2) {}
            SelectableButton(title: "selected", selected: .constant(1), index: 2) {}
        }
    }
}
