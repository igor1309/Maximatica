//
//  File.swift
//  
//
//  Created by Igor Malyarov on 03.06.2020.
//

import Foundation

public extension BinaryFloatingPoint {
    var smartFormatted: String {
        if self < 1 {
            return Formatter.flexiblePercentage.string(for: self) ?? ""
        } else {
            return Formatter.flexibleGrouped.string(for: self) ?? ""
        }
    }

    var formattedPercentage: String {
        return Formatter.percentageFormat.string(for: self) ?? ""
    }
    
    var formattedPercentageWithDecimals: String {
        return Formatter.percentageWithDecimalsFormat.string(for: self) ?? ""
    }
    
    var formattedPercentageWith1Decimal: String {
        return Formatter.percentageWith1DecimalsFormat.string(for: self) ?? ""
    }
    
    var formattedPercentageWithMax5Decimal: String {
        return Formatter.percentageWithMax5DecimalsFormat.string(for: self) ?? ""
    }
    
    var formattedGrouped: String {
        return Formatter.groupedFormat.string(for: self) ?? ""
    }
    
    var formattedGroupedWithDecimals: String {
        return Formatter.groupedWithDecimalsFormat.string(for: self) ?? ""
    }
    var formattedGroupedWithMax2Decimals: String {
        return Formatter.groupedWithMax2DecimalsFormat.string(for: self) ?? ""
    }
    
    var formattedGroupedWith1Decimal: String {
        return Formatter.groupedWith1DecimalFormat.string(for: self) ?? ""
    }
}

