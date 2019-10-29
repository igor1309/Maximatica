//
//  MathCardButton.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MathCardButton: View {
    
    let name: String
    let color: Color
    let action: () -> Void
    
    init(_ name: String, color: Color = .white, action: @escaping () -> Void) {
        self.name = name
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(name.uppercased())
                .font(.title)
                .foregroundColor(color)
                .frame(width: 240, height: 50)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke()
                    .opacity(1)
                    .foregroundColor(color))
        }
    }
}

struct MathCardButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing:  16) {
            MathCardButton("Вычитание") {}
            MathCardButton("Сложение", color: .pink) {}
        }
        .padding().padding().padding()
        .background(Color.purple)
            //        .environment(\.colorScheme, .dark)
            .previewLayout(.fixed(width: 350, height: 500))
    }
}
