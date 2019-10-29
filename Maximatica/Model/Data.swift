//
//  Data.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

let historyData = loadHistoryData()

func loadHistoryData() -> History {
    guard let data: History = loadFromDocDir("history.json") else { return History(results: []) }
    return data
}

