//
//  TimeInterval+Format.swift
//  
//
//  Created by Igor Malyarov on 03.06.2020.
//

import Foundation

public extension TimeInterval {
    var formatMinutesSeconds: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? "n/a"
    }

    var formatHoursMinutes: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.hour, .minute]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? "n/a"
    }
}

