//
//  ResultView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @Binding var isRunning: Bool
    var body: some View {
        VStack(spacing: 16) {
            Text("TBD: Result")
            Button(action: {
                if hapticsAvailable {
                    let generator = UIImpactFeedbackGenerator(style: .light)
                    generator.impactOccurred()
                }

                self.isRunning = false
            }) {
                Text("OK")
                    .fontWeight(.heavy)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding().padding(.horizontal)
                    .background(Capsule(style: .circular)
                        .stroke().foregroundColor(.systemGreen))
                
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(isRunning: .constant(false))
    }
}
