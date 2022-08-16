//
//  BinaryFloatingPoint+threeSignificantDigits.swift
//  
//
//  Created by Igor Malyarov on 03.06.2020.
//

import Foundation

public extension BinaryFloatingPoint {
    var threeSignificantDigits: String {
        
        if self == 0 {
            return "0"
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

