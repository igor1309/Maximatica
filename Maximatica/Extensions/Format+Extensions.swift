//
//  Format+Extensions.swift
//
//  Created by Igor Malyarov on 31.07.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

extension TimeInterval {
    var formatMinuteSecond: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? "n/a"
    }
}


public extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

public extension Int {
    var formattedFlat: String {
        Formatter.formattedFlat.string(for: self) ?? ""
    }
}

public extension Formatter {
    static let formattedFlat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = false
        formatter.maximumFractionDigits = 0
        return formatter
    }()
}

public extension Int {
    var smartNotation: String {
        Double(self).smartNotation
    }
    var threeSignificantDigits: String {
        Double(self).threeSignificantDigits
    }
}

public extension Double {
    var threeSignificantDigits: String {
        
        if self == 0 {
            return Formatter.groupedFormat.string(for: self) ?? "n/a"
        }
        
        if self < 10 {
            return Formatter.groupedWithDecimalsFormat.string(for: self) ?? "n/a"
        }
        
        if self < 100 {
            return Formatter.groupedWith1DecimalFormat.string(for: self) ?? "n/a"
        }
        
        
        if self < 1_000 {
            return Formatter.groupedFormat.string(for: self) ?? "n/a"
        }

        if self < 10_000 {
            if let s = Formatter.groupedWithDecimalsFormat.string(for: self / 1_000) {
                return s + "k"
            } else {
                return "n/a"
            }
        }
        
        if self < 100_000 {
            if let s = Formatter.groupedWith1DecimalFormat.string(for: self / 1_000) {
                return s + "k"
            } else {
                return "n/a"
            }
        }
        
        if self < 1_000_000 {
            if let s = Formatter.groupedFormat.string(for: self / 1_000) {
                return s + "k"
            } else {
                return "n/a"
            }
        }
        
        if self < 10_000_000 {
            if let s = Formatter.groupedWithDecimalsFormat.string(for: self / 1_000_000) {
                return s + "m"
            } else {
                return "n/a"
            }
        }
        
        if self < 100_000_000 {
            if let s = Formatter.groupedWith1DecimalFormat.string(for: self / 1_000_000) {
                return s + "m"
            } else {
                return "n/a"
            }
        }
        
        if self < 1_000_000_000 {
            if let s = Formatter.groupedFormat.string(for: self / 1_000_000) {
                return s + "m"
            } else {
                return "n/a"
            }
        }
        
        if self < 10_000_000_000 {
            if let s = Formatter.groupedWithDecimalsFormat.string(for: self / 1_000_000_000) {
                return s + "b"
            } else {
                return "n/a"
            }
        }
        
        if self < 100_000_000_000 {
            if let s = Formatter.groupedWith1DecimalFormat.string(for: self / 1_000_000_000) {
                return s + "b"
            } else {
                return "n/a"
            }
        }
        
        if let s = Formatter.groupedFormat.string(for: self / 1_000_000_000) {
            return s + "b"
        } else {
            return "n/a"
        }
    }
    
    var smartNotation: String {
        if self == 0 {
            return Formatter.groupedFormat.string(for: self) ?? "n/a"
        }

        if self < 10 {
            return Formatter.groupedWithDecimalsFormat.string(for: self) ?? "n/a"
        }
        
        if self < 100 {
            return Formatter.groupedWith1DecimalFormat.string(for: self) ?? "n/a"
        }
        
        
        if self < 1_000 {
            return Formatter.groupedFormat.string(for: self) ?? "n/a"
        }

        if self < 10_000 {
            if let s = Formatter.groupedWith1DecimalFormat.string(for: self / 1_000) {
                return s + "k"
            } else {
                return "n/a"
            }
        }
        
        if self < 1_000_000 {
            if let s = Formatter.groupedFormat.string(for: self / 1_000) {
                return s + "k"
            } else {
                return "n/a"
            }
        }
        
        if self < 10_000_000 {
            if let s = Formatter.groupedWith1DecimalFormat.string(for: self / 1_000_000) {
                return s + "m"
            } else {
                return "n/a"
            }
        }
        
        if self < 1_000_000_000 {
            if let s = Formatter.groupedFormat.string(for: self / 1_000_000) {
                return s + "m"
            } else {
                return "n/a"
            }
        }
        
        if self < 10_000_000_000 {
            if let s = Formatter.groupedWith1DecimalFormat.string(for: self / 1_000_000_000) {
                return s + "b"
            } else {
                return "n/a"
            }
        }
        
        if let s = Formatter.groupedFormat.string(for: self / 1_000_000_000) {
            return s + "b"
        } else {
            return "n/a"
        }
    }
}

public extension Formatter {
    static let groupedWith1DecimalsFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter
    }()
}

public extension Formatter {
    static let flexibleGrouped: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static let flexiblePercentage: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
}

public extension Double {
    var smartFormatted: String {
        if self < 1 {
            return Formatter.flexiblePercentage.string(for: self) ?? ""
        } else {
            return Formatter.flexibleGrouped.string(for: self) ?? ""
        }
    }
}

public extension Int {
    var formattedGrouped: String {
        return Formatter.groupedFormat.string(for: self) ?? ""
    }
}

public extension Double {
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

public extension Formatter {
    static let groupedFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter
    }()
    
    static let groupedWithDecimalsFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static let groupedWithMax2DecimalsFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static let groupedWith1DecimalFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    static let percentageFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        return formatter
    }()
    
    static let percentageWithDecimalsFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    static let percentageWith1DecimalsFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        return formatter
    }()
    
    static let percentageWithMax5DecimalsFormat: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 5
        return formatter
    }()
}
