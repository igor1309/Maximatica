//
//  GameStatusTitle.swift
//  GameStatesTesting
//
//  Created by Igor Malyarov on 01.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct GameStatusTitle: View {
    var title: String
    var withButtons = false
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            if withButtons {
                HStack {
                    Button(action: {}) {
                        Image(systemName: "gear")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                    }
                    Button(action: {}) {
                        Image(systemName: "chart.bar.fill")
                            .padding(.top, 8)
                            .padding(.trailing, 16)
                    }
                }
                .foregroundColor(.white)
            }
            
            HStack {
                Text(verbatim: title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .padding(.top)
        }
    }
}

struct GameStatusTitle_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                MainGradient()
                
                VStack {
                    GameStatusTitle(title: "Maximatica")
                    Divider()
                    GameStatusTitle(title: "Maximatica", withButtons: true)
                }
            }
        }
        .environment(\.colorScheme, .dark)
    }
}
