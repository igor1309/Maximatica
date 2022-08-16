//
//  Double+format.swift
//  
//
//  Created by Igor Malyarov on 03.06.2020.
//

import Foundation

extension Double {
    public func format(percentage: Bool, decimals: Int) -> String {
        let number = self.rounded(toPlaces: percentage ? decimals + 2 : decimals)
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = decimals
        formatter.maximumFractionDigits = decimals
        formatter.usesGroupingSeparator = true
        if percentage {
            formatter.numberStyle = .percent
        } else {
            formatter.numberStyle = .decimal        }
        
        return formatter.string(for: number) ?? ""
    }
}
