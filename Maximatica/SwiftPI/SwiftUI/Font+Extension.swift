//
//  Font+Extension.swift
//  BondCashFlow
//
//  Created by Igor Malyarov on 09.09.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

#if !os(macOS)
import UIKit
import SwiftUI

@available(iOS 13, *)
public extension Font {
    static var title1 = Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1))
//    static var title2 = Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title2))
    static var title3 = Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3))
    static var caption1 = Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1))
//    static var caption2 = Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption2))

//    static var title2 = Font.system(size: 22)
//    static var title3 = Font.system(size: 20)
//    static var caption2 = Font.system(size: 10)
}
#endif
