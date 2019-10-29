//
//  SolveTheProblemBanner.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct SolveTheProblemBanner: View {
    var body: some View {
        Text("Реши задачу!".uppercased())
        .font(.largeTitle)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .padding(6)
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
            .foregroundColor(.systemRed))
        .padding()
    }
}

struct SolveTheProblemBanner_Previews: PreviewProvider {
    static var previews: some View {
        SolveTheProblemBanner()
    }
}
