//
//  MAXImaticaUITests.swift
//  MAXImaticaUITests
//
//  Created by Igor Malyarov on 07.11.2019.
//  Copyright © 2019 Igor Malyarov. All rights reserved.
//

import XCTest

class MAXImaticaUITests: XCTestCase {
    
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
//        app.launchArguments.append("--uitestingOnboarding")
        app.launchArguments.append("--uitesting")
    }
    
    // MARK: - Tests
    
    func testSetup() {
        
        app.launch()
        
        // Make sure we're displaying ScoreView
        XCTAssertTrue(app.isDisplayingScoreView)
        
        app.buttons["ИГРАТЬ!"].tap()
        
        // Make sure we're displaying SetupView
        XCTAssertTrue(app.isDisplayingSetupView)
        
        app.buttons["15 минут"].tap()
        app.buttons["10 минут"].tap()
        app.buttons["5 минут"].tap()
        
        app.buttons["ДЕЛЕНИЕ"].tap()
        app.buttons["УМНОЖЕНИЕ"].tap()
        app.buttons["ВЫЧИТАНИЕ"].tap()
        app.buttons["СЛОЖЕНИЕ"].tap()
        
//        // go back to Score
//        app.buttons["ОТМЕНА"].tap()
//
//        // Make sure we're displaying ScoreView
//        XCTAssertTrue(app.isDisplayingScoreView)
//
//        app.buttons["ИГРАТЬ!"].tap()
//
//        // Make sure we're displaying SetupView
//        XCTAssertTrue(app.isDisplayingSetupView)
        
        app.buttons["НАЧАТЬ"].tap()
        
        // Make sure we're displaying GameView
        XCTAssertTrue(app.isDisplayingPlayView)
        
        app.staticTexts["8"].tap()
        app.buttons["ДАЛЬШЕ"].tap()
        app.staticTexts["8"].tap()
        app.buttons["ДАЛЬШЕ"].tap()
        app.staticTexts["8"].tap()
        app.buttons["ДАЛЬШЕ"].tap()
        app.staticTexts["8"].tap()
        app.buttons["ДАЛЬШЕ"].tap()

        
        app.waitForExistence(timeout: 15)
    }
    
}
