//
//  ProgressBar.swift
//  Maximatica
//
//  Created by Igor Malyarov on 03.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI

struct ProgressShape: Shape {
    let progress: Double
    
    func path(in rect1: CGRect) -> Path {
        let rect = rect1.insetBy(dx: rect1.maxY / 2 + 1, dy: 0)
        var path = Path()
        path.addLines([CGPoint(x: rect.minX, y: rect.midY), CGPoint(x: rect.maxX * CGFloat(progress), y: rect.midY)])
        //        path.addRect(rect)
        
        return path
    }
}

struct ProgressBar: View {
    let progress: Double
    var width: Double = 200
    var height: Double = 12
    var colors: [Color] = [.red, .yellow, .green]
    
    var body: some View {
        let spectrum = Gradient(colors: colors.reversed())
        let linear = LinearGradient(gradient: spectrum, startPoint: .trailing, endPoint: .leading)
        return ZStack(alignment: .leading) {
            ProgressShape(progress: 1)
                .stroke(Color.gray.opacity(0.2),
                    style: StrokeStyle(
                        lineWidth: CGFloat(height),
                        lineCap: .round,
                        lineJoin: .round,
                        miterLimit: 0,
                        dash: [],
                    dashPhase: 0))
            
            ProgressShape(progress: progress)
                .stroke(linear,
                        style: StrokeStyle(
                            lineWidth: CGFloat(height),
                            lineCap: .round,
                            lineJoin: .round,
                            miterLimit: 0,
                            dash: [],
                        dashPhase: 0))
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
    }
}
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.yellow
                .opacity(0.7)
            
            VStack {
                ProgressBar(progress: 0.2, height: 20)
                ProgressBar(progress: 0.8, height: 20)
                ProgressBar(progress: 0.8, height: 50)
                ProgressBar(progress: 0.5)
                ProgressBar(progress: 0.7)
                ProgressBar(progress: 1)
            }
            .padding()
        }
    }
}
