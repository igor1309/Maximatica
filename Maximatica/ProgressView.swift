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
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .frame(width: 120, height: 16)
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.blue)
                .frame(width: 120 * CGFloat(progress), height: 16)
            
        }
    }
}

struct ProgressViewUsage: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [.systemBlue, .systemGreen]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
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
