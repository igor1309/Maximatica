//
//  BarChartView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct BarChartView: View {
    var title: String = ""
    var bars: [Double]
    
    var body: some View {
        let maxBar = bars.max() ?? 0
        let minBar = bars.min() ?? 0
        
        return VStack(alignment: .leading, spacing: 6) {
            if bars.isEmpty {
                Text("Нет данных для графиков")
                    .foregroundColor(.white)
            } else {
                Text(verbatim: title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Spacer()
                        Text("\(minBar.smartFormatted) - \(maxBar.smartFormatted)")
                            .foregroundColor(.white)
                    }
                    .font(.subheadline)
                    
                    BarsView(bars: bars, minBar: CGFloat(minBar), maxBar: CGFloat(maxBar))
                }
                .padding(.vertical)
            }
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                HistoryGradient()
                
                BarChartView(title: "title",
                             bars: [10, 20, 15, 18, 0, 10, 22, 15, 18, 32, 27, 1])
                //        .padding()
            }
        }
    }
}
