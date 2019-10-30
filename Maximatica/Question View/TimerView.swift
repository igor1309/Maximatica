//
//  TimerView.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import SwiftUI
import SwiftPI

struct TimerView: View {
    @Binding var timer: TimeInterval
    
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(timer.formatMinuteSecond)
            .font(.subheadline)
            .foregroundColor(.white)
            .onReceive(timer1) { _ in
                self.timer += 1
        }
    }
}

struct TimerViewPreview: View {
    @State private var timer: TimeInterval = 0
    
    var body: some View {
        TimerView(timer: $timer)
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerViewPreview()
    }
}
