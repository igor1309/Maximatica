//
//  HorizontalBar.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct HorizontalBar: View {
    var bar: Double
    var minBar: Double = 0
    var maxBar: Double
    var width: Double = 200
    var height: Double = 12
    var colors: [Color] = [.systemTeal, .blue]
    
    var body: some View {
        
        let spectrum = Gradient(colors: colors.reversed())
        let linear = LinearGradient(gradient: spectrum, startPoint: .trailing, endPoint: .leading)
        
        let spectrumMinMax = Gradient(colors: colors.reversed())
        let linearMin = LinearGradient(gradient: spectrumMinMax, startPoint: .trailing, endPoint: .leading)
        let linearMax = LinearGradient(gradient: spectrumMinMax, startPoint: .trailing, endPoint: .leading)
        
        return ZStack(alignment: .leading) {
            Capsule()
                .frame(width: CGFloat(width), height: CGFloat(height))
                .opacity(0.1)
            Capsule()
                .fill(bar == maxBar ? linearMax : bar == minBar ? linearMin : linear)
                .frame(width: CGFloat(bar / maxBar * width), height: CGFloat(height))
        }
    }
}


struct HorizontalBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                HistoryGradient()
                
                VStack {
                    HorizontalBar(bar: 100, maxBar: 120, width: 200, height: 12)
                        .border(Color.pink)
                    HorizontalBar(bar: 100, maxBar: 120, width: 200, height: 12)
                    HorizontalBar(bar: 120, maxBar: 120, width: 200, height: 12)
                    HorizontalBar(bar: 10, minBar: 10, maxBar: 120, width: 200, height: 12)
                    HorizontalBar(bar: 50, maxBar: 120, width: 200, height: 12)
                }
            }
        }
    }
}
