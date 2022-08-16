//
//  Functions.swift
//  BondCashFlow
//
//  Created by Igor Malyarov on 09.09.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

public func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

