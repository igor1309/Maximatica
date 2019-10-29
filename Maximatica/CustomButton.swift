//
//  CustomButton.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct CustomButton<Something: View>: View {
    
    let action: () -> Void
    let content: Something
    
    init(action: @escaping () -> Void, @ViewBuilder content: () -> Something) {
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        Button(action: action) {
            content
            .padding()
                .frame(maxWidth: .infinity)
                .background(Capsule().fill(Color.blue))
                .foregroundColor(.white)
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {}) {
            Text("Custom Button")
        }
    .padding()
    }
}
