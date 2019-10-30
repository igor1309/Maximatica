//
//  VerticalBar.swift
//  Maximatica
//
//  Created by Igor Malyarov on 30.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct VerticalBar: View {
    var bar: CGFloat
    var minBar: CGFloat = 0
    var maxBar: CGFloat
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        
        let spectrum = Gradient(colors: [.blue, .systemTeal])
        let linear = LinearGradient(gradient: spectrum, startPoint: .top, endPoint: .bottom)
       
        let spectrumMinMax = Gradient(colors: [.systemIndigo, .purple])
        let linearMin = LinearGradient(gradient: spectrumMinMax, startPoint: .top, endPoint: .bottom)
        let linearMax = LinearGradient(gradient: spectrumMinMax, startPoint: .top, endPoint: .bottom)

        return ZStack(alignment: .bottom) {
            Capsule()
                .frame(width: width, height: height)
                .opacity(0.1)
            Capsule()
                .fill(bar == maxBar ? linearMax : bar == minBar ? linearMin : linear)
                .frame(width: width, height: bar / maxBar * height)
        }
    }
}


struct VerticalBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                HistoryGradient()
                
                HStack {
                    VerticalBar(bar: 100, maxBar: 120, width: 12, height: 200)
                    VerticalBar(bar: 120, maxBar: 120, width: 12, height: 200)
                    VerticalBar(bar: 10, minBar: 10, maxBar: 120, width: 12, height: 200)
                    VerticalBar(bar: 50, maxBar: 120, width: 12, height: 200)
                }
            }
        }
    }
}
