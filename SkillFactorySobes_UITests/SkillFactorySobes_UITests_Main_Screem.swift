//
//  SkillFactorySobes_UITests.swift
//  SkillFactorySobes_UITests
//
//  Created by Иван Тарасенко on 30.05.2023.
//

import XCTest

final class SkillFactorySobes_UITests_Main_Screem: XCTestCase {

    let accessibility = AccessibilityIdentifierCell()
    var app: XCUIApplication!
    
    var cell: XCUIElement!
    var nameLabel: XCUIElement!
    var characterImage: XCUIElement!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        
        cell = app.cells.element(boundBy: 0)
        nameLabel = app.staticTexts[accessibility.nameLabel]
        characterImage = app.images[accessibility.characterImage]
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testForPresenceOfElements() throws {
        sleep(1)
            
            XCTAssert(cell.exists)
            XCTAssertTrue(nameLabel.exists)
            XCTAssertTrue(characterImage.exists)
        }
    
    func testTapCell() throws {
        cell.tap()
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
