//
//  UserData.swift
//  Maximatica
//
//  Created by Igor Malyarov on 29.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

final class UserData: ObservableObject {
    
    @Published var history: History = historyData {
        didSet {    // save data to local JSON
            saveJSON(data: history, filename: "history.json")
        }
    }
}
