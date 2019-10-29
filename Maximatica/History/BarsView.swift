//
//  BarsView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct BarsView: View {
    var title: String = ""
    var bars: [Double]
    
    var body: some View {
        
        
        let maxBar = bars.max() ?? 0
        let minBar = bars.min() ?? 0
        let count = bars.count
        let width: CGFloat = min(52, 343 / 2 / CGFloat(count))
        
        
        return VStack(alignment: .leading, spacing: 6) {
            if bars.isEmpty {
                    Text("Нет данных для графиков")
                        .foregroundColor(.white)
            } else {
                Text(verbatim: title)
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Spacer()
                        Text("\(minBar.smartFormatted) - \(maxBar.smartFormatted)")
                    }
                    .font(.subheadline)

                    VStack(spacing: 0) {
                        HStack(alignment: .bottom, spacing: width / 1) {
                            ForEach(bars, id: \.self) { bar in
                                Capsule()
                                    .frame(width: width, height: bar == 0 ? 1 : CGFloat(bar / maxBar) * 200)
                                    .foregroundColor(bar == maxBar ? .blue : .systemTeal)
                            }
                        }
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 0.3)
                            .foregroundColor(.white)
                    }
                }
                            .padding(.vertical)
            }
        }
    }
}

struct BarsView_Previews: PreviewProvider {
    static var previews: some View {
        BarsView(bars: [10, 20, 15, 18, 0, 10, 20, 15, 18, 0, 2, 15, 18, 32, 27, 1])
        //        .padding()
    }
}
