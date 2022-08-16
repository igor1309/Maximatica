//
//  Double+rounded.swift
//  
//
//  Created by Igor Malyarov on 03.06.2020.
//

import Foundation

public extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
