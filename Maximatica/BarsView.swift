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
        
        let maxBar = bars.max()!
        let count = bars.count
        let width: CGFloat = 343 / 2 / CGFloat(count)
        
        return VStack(alignment: .leading, spacing: 6) {
            Text(verbatim: title)
                .font(.headline)
            
            VStack(alignment: .trailing, spacing: 8) {
                Group {
                    Text("максимум ")
                        + Text(maxBar.smartFormatted)
                }
                .font(.subheadline)
                
                HStack(alignment: .bottom) {
                    ForEach(bars, id: \.self) { bar in
                        RoundedRectangle(cornerRadius: width / 2, style: .continuous)
                            .frame(width: width, height: bar == 0 ? 1 : CGFloat(bar / maxBar) * 200)
                            .foregroundColor(bar == maxBar ? .blue : .systemTeal)
                    }
                }
            }
        }
        .padding(.vertical)
    }
}

struct BarsView_Previews: PreviewProvider {
    static var previews: some View {
        BarsView(bars: [10, 20, 15, 18, 0, 10, 20, 15, 18, 0, 10, 20, 15, 18, 32, 10, 20, 15, 18, 32, 27, 1])
        //        .padding()
    }
}
