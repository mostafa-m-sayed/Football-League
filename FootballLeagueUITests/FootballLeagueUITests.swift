//
//  FootballLeagueUITests.swift
//  FootballLeagueUITests
//
//  Created by Mostafa Sayed on 17/10/2020.
//

import XCTest

class FootballLeagueUITests: XCTestCase {
    let app = XCUIApplication()
    
    func testGoToFavourites() {
        app.launch()

        XCUIApplication().tabBars["Tab Bar"].otherElements.containing(.image, identifier:"favorite").element.tap()
        XCTAssertTrue(app.otherElements["FavouritesVC"].waitForExistence(timeout: 5))
    }
    
    func testFavouriteTeam() {
        app.launch()
        let table = XCUIApplication().tables
        let cell = table.children(matching: .cell).firstMatch
        cell.buttons["love"].tap()
        
        let banner = app.children(matching: .window).element(boundBy: 1).children(matching: .other).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element
        XCTAssertTrue(banner.waitForExistence(timeout: 5))
    }

    func testGoToTeam() {
        app.launch()
        let table = XCUIApplication().tables
        let cell = table.children(matching: .cell).firstMatch
        cell.tap()
        XCTAssertTrue(app.otherElements["TeamVC"].waitForExistence(timeout: 5))
    }
}
