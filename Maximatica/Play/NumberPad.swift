//
//  NumberPad.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct PadButton: View {
    var face: String
    var body: some View {
        Text(face)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.blue)
            .frame(width: 100, height: 56, alignment: .center)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .foregroundColor(face.isEmpty ? .clear : .yellow))
            
            .contentShape(Rectangle())
    }
}


struct NumberPad: View {
    @Binding var text: String
    
    let numberPad = [["1", "2", "3"],
                     ["4", "5", "6"],
                     ["7", "8", "9"],
                     ["", "0", "⌫"]
    ]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(numberPad, id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { face in
                        PadButton(face: face)
                            .onTapGesture {
                                self.tapped(face: face)
                        }
                    }
                }
            }
        }
    }
    
    private func tapped(face: String) {
        switch face {
        case "⌫":
            text = String(text.dropLast(1))
        default:
            text.append(face)
        }
    }
}

struct NumberPad_Previews: PreviewProvider {
    static var previews: some View {
        NumberPad(text: .constant("23"))
    }
}
