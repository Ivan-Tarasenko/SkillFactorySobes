//
//  SkillFactorySobes_UITests_Detail_Screen.swift
//  SkillFactorySobes_UITests
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import XCTest

final class SkillFactorySobes_UITests_Detail_Screen: XCTestCase {
    
    let accessibility = AccessibilityIdentifierDetailController()
    var app: XCUIApplication!
    
    var cell: XCUIElement!
    var characterImage: XCUIElement!
    var nameLabel: XCUIElement!
    var statusLabel: XCUIElement!
    var speciesLabel: XCUIElement!
    var genderLabel: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        cell = app.cells.element(boundBy: 0)
        characterImage = app.images[accessibility.characterImage]
        nameLabel = app.staticTexts[accessibility.nameLabel]
        statusLabel = app.staticTexts[accessibility.statusLabel]
        speciesLabel = app.staticTexts[accessibility.speciesLabel]
        genderLabel = app.staticTexts[accessibility.genderLabel]
    }
    
    override func tearDownWithError() throws {
        app = nil
    }
    
    func testForPresenceOfElements() throws {
        
        cell.tap()
        
        XCTAssertTrue(characterImage.exists)
        XCTAssertTrue(nameLabel.exists)
        XCTAssertTrue(statusLabel.exists)
        XCTAssertTrue(speciesLabel.exists)
        XCTAssertTrue(genderLabel.exists)
        
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
