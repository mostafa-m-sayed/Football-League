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

        let tabBar = XCUIApplication().tabBars["Tab Bar"]
        tabBar.children(matching: .other).element(boundBy: 1).tap()
        XCTAssertTrue(app.otherElements["FavouritesVC"].waitForExistence(timeout: 5))
    }
    
    func testFavouriteTeam() {
        app.launch()
        let table = XCUIApplication().tables//.cells[0].
        let cell = table.children(matching: .cell).firstMatch
        cell.buttons["love"].tap()
    }

    func testGoToTeam() {
        app.launch()
        let table = XCUIApplication().tables
        let cell = table.children(matching: .cell).firstMatch
        cell.tap()
        XCTAssertTrue(app.otherElements["TeamVC"].waitForExistence(timeout: 5))
    }
}
