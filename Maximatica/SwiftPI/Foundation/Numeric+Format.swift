//
//  Numeric+Format.swift
//  
//
//  Created by Igor Malyarov on 03.06.2020.
//

import Foundation

public extension Numeric {
    var formattedFlat: String {
        Formatter.formattedFlat.string(for: self) ?? ""
    }
}

