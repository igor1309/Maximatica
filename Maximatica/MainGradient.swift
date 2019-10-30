//
//  MainGradient.swift
//  Maximatica
//
//  Created by Igor Malyarov on 30.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct MainGradient: View {
    var body: some View {
        LinearGradient(gradient:
            Gradient(colors: [.blue, .green]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainGradient_Previews: PreviewProvider {
    static var previews: some View {
        MainGradient()
    }
}
