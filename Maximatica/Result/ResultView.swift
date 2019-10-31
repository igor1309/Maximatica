//
//  ResultView.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ResultView: View {
    @Binding var status: Status
    
    var body: some View {
        VStack(spacing: 32) {
            GameStatusTitle(title: "Результат")
            Spacer()
            
            Text("Игра: вот результат")
            Spacer()
            
            GameButton(action: { self.status = .score }) {
                Text("Ok".uppercased())
            }
            
            Spacer()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            MainGradient()
            
            ResultView(status: .constant(.result))
        }
    }
}
