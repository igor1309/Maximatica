//
//  XCUIApplication+Extension.swift
//  MAXImaticaUITests
//
//  Created by Igor Malyarov on 07.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import XCTest

extension XCUIApplication {
    var isDisplayingOnboarding: Bool {
        return scrollViews["onboardingView"].exists
    }
    
    var isDisplayingScoreView: Bool {
        return staticTexts["scoreView"].exists
    }
    
    var isDisplayingSetupView: Bool {
        return staticTexts["setupView"].exists
    }
    
    var isDisplayingPlayView: Bool {
        return staticTexts["playView"].exists
    }
}
