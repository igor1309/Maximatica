//
//  HistoryGradient.swift
//  Maximatica
//
//  Created by Igor Malyarov on 30.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HistoryGradient: View {
    var body: some View {
        LinearGradient(gradient:
            Gradient(colors: [.orange, .yellow, .blue]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .opacity(0.9)
            .edgesIgnoringSafeArea(.all)
    }
}

struct HistoryGradient_Previews: PreviewProvider {
    static var previews: some View {
        HistoryGradient()
    }
}
