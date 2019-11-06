//
//  SettingsStore.swift
//  Maximatica
//
//  Created by Igor Malyarov on 28.10.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import Foundation

final class SettingsStore: ObservableObject {
    @Published var period = Period(rawValue: UserDefaults.standard.string(forKey: "period") ?? Period.week.id)!
        {
        didSet {
            UserDefaults.standard.set(period.rawValue, forKey: "period")
        }
    }
    
    @Published var hasLaunchedBefor = UserDefaults.standard.bool(forKey: "hasLaunchedBefor") {
        didSet {
            UserDefaults.standard.set(hasLaunchedBefor, forKey: "hasLaunchedBefor")
        }
    }
}
