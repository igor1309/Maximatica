//
//  BinaryInteger+Format.swift
//  
//
//  Created by Igor Malyarov on 03.06.2020.
//

import Foundation

public extension BinaryInteger {
    var smartNotation: String {
        Double(self).smartNotation
    }
    var threeSignificantDigits: String {
        Double(self).threeSignificantDigits
    }

    var formattedGrouped: String {
        return Formatter.groupedFormat.string(for: self) ?? ""
    }
}

