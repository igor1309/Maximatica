//
//  BarsView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 30.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct BarsView: View {
    var bars: [Double]
    var minBar: CGFloat = 0
    var maxBar: CGFloat
    
    
    var body: some View {
        let count = bars.count
        let width: CGFloat = min(52, 343 / 2 / CGFloat(count))
        
        return VStack(spacing: 0) {
            HStack(alignment: .bottom, spacing: width / 1) {
                ForEach(bars, id: \.self) { bar in
                    
                    VerticalBar(bar: CGFloat(bar),
                                minBar: CGFloat(self.minBar),
                                maxBar: CGFloat(self.maxBar),
                                width: width,
                                height: 200)
                }
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 0.3)
                .foregroundColor(.white)
        }
    }
}

struct BarsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                HistoryGradient()
                
                BarsView(bars: [10, 20, 15, 18, 1, 10, 22, 15, 18, 32, 27, 1],
                         minBar: 1,
                         maxBar: 32)
            }
        }
    }
}
