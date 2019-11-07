//
//  OnboardingUITests.swift
//  MAXImaticaUITests
//
//  Created by Igor Malyarov on 07.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import XCTest

class OnboardingUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    // MARK: - XCTestCase
    
    override func setUp() {
        XCUIApplication().terminate()
        super.setUp()
        
        // Since UI tests are more expensive to run, it's usually a good idea
        // to exit if a failure was encountered
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitestingOnboarding")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGoingThroughOnboarding() {
        
        app.launch()
        
        // Make sure we're displaying onboarding
        XCTAssertTrue(app.isDisplayingOnboarding)
        
        let onboardingviewScrollView = XCUIApplication().scrollViews["onboardingView"]
        let elementsQuery = onboardingviewScrollView.otherElements
        
        // tapping on MissionTimeSelector
        elementsQuery.buttons["15 минут"].tap()
        elementsQuery.buttons["10 минут"].tap()
        elementsQuery.buttons["5 минут"].tap()
        
        // tapping on MissionQtySelector
        elementsQuery.buttons["10"].tap()
        elementsQuery.buttons["20"].tap()
        elementsQuery.buttons["50"].tap()
        elementsQuery.buttons["100"].tap()
        
        
        // Swipe down to go through the pages
        app.swipeUp()
        
        // Tap the "Done" button
        app.buttons["ПОНЯТНО, ПОЕХАЛИ"].tap()
        
        // Onboarding should no longer be displayed
        XCTAssertFalse(app.isDisplayingOnboarding)
    }
}
