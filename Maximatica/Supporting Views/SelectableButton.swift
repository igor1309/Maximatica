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
    var hapticsAvailable: Bool { CHHapticEngine.capabilitiesForHardware().supportsHaptics }
    let smallScreen = UIScreen.main.bounds.height < 700
    
    var title: String
    @Binding var selected: Int
    var index: Int
    var color: Color = .white
    var action: () -> Void
    
    init(title: String, selected: Binding<Int>, index: Int, color: Color = .white, action: @escaping () -> Void) {
        self.title = title
        self._selected = selected
        self.index = index
        self.color = color
        self.action = action
    }
    
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
            Text(NSLocalizedString(title, comment: "").uppercased())
                .font(.headline)
                .foregroundColor(color)
                .frame(width: 200, height: smallScreen ? 12 : 24)
                .padding()
                .padding(.horizontal)
                .background(Color.white.opacity(selected == index ? 0.3 : 0))
                .cornerRadius(16)
                .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke()
                    .foregroundColor(color))
        }
    }
}

struct SelectableButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            SelectableButton(title: "selected", selected: .constant(2), index: 2) {}
            SelectableButton(title: "selected", selected: .constant(1), index: 2) {}
            SelectableButton(title: "selected", selected: .constant(2), index: 2) {}
                .environment(\.colorScheme, .dark)
            SelectableButton(title: "selected", selected: .constant(1), index: 2) {}
                .environment(\.colorScheme, .dark)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue).opacity(1)
    }
}
