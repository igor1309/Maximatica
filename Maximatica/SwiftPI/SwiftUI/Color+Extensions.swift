//
//  Color+Extensions.swift
//  CardModifier
//
//  Created by Igor Malyarov on 05.08.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

#if !os(macOS)
import UIKit
import SwiftUI

@available(iOS 13.0, *)
public extension Color {
    init(_ hex: UInt32, opacity:Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

@available(iOS 13, *)
public extension Color {
    static var tertiary = Color(UIColor.tertiaryLabel)
    
    static var systemFill = Color(UIColor.systemFill)
    static var secondarySystemFill = Color(UIColor.secondarySystemFill)
    static var tertiarySystemFill = Color(UIColor.tertiarySystemFill)
    static var quaternarySystemFill = Color(UIColor.quaternarySystemFill)

    static var lightGray = Color(UIColor.lightGray)
    static var darkGray = Color(UIColor.darkGray)
    
    static var systemGray = Color(UIColor.systemGray)
    static var systemGray2 = Color(UIColor.systemGray2)
    static var systemGray3 = Color(UIColor.systemGray3)
    static var systemGray4 = Color(UIColor.systemGray4)
    static var systemGray5 = Color(UIColor.systemGray5)
    static var systemGray6 = Color(UIColor.systemGray6)

    static var systemBlue = Color(UIColor.systemBlue)
    static var systemGreen = Color(UIColor.systemGreen)
    static var systemIndigo = Color(UIColor.systemIndigo)
    static var systemOrange = Color(UIColor.systemOrange)
    static var systemPink = Color(UIColor.systemPink)
    static var systemPurple = Color(UIColor.systemPurple)
    static var systemRed = Color(UIColor.systemRed)
    static var systemTeal = Color(UIColor.systemTeal)
    static var systemYellow = Color(UIColor.systemYellow)
    
    static var systemBackground = Color(UIColor.systemBackground)
    static var secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static var tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)
    
    static var systemGroupedBackground = Color(UIColor.systemGroupedBackground)
    static var secondarySystemGroupedBackground = Color(UIColor.secondarySystemGroupedBackground)
    static var tertiarySystemGroupedBackground = Color(UIColor.tertiarySystemGroupedBackground)
}
#endif
