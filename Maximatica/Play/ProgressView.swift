//
//  ProgressView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ProgressView: View {
    var progress: Double
    let width: CGFloat = 120
    let height: CGFloat = 8
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .foregroundColor(.white).opacity(0.4)
                .frame(width: width, height: height)
            
            Capsule()
                .foregroundColor(.yellow)
                .frame(width: width * CGFloat(progress), height: height)
            
        }
    }
}

struct ProgressViewUsage: View {
    var body: some View {
        ZStack {
            MainGradient()
            
            ProgressView(progress: 0.35)
                .offset(x: 100, y: -250)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressViewUsage()
    }
}
