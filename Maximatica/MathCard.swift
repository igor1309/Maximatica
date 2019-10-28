//
//  MathCard.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MathCard: View {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Text(name.uppercased())
            .font(.title)
            .foregroundColor(.white)
            .frame(width: 240, height: 50)
            .modifier(CardView(borderColor: .white,
                               cornerRadius: 16))
        //        .padding([.horizontal, .bottom])
    }
}

struct MathCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MathCard("Сложение")
        }
        .environment(\.colorScheme, .dark)
    }
}
