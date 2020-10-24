//
//  KiKUITests.swift
//  KiKUITests
//
//  Created by Justyna Kowalkowska on 22/10/2020.
//

import XCTest
import SnapshotTesting

class KiKUITests: XCTestCase {

    override func setUpWithError() throws {
      
        XCUIApplication().launch()
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        
        XCUIApplication().terminate()
    }

    func test_IfButtonAreTappable() throws {
       
        KiKPageObject.button1.tap()
        XCTAssert(KiKPageObject.button1.label == "O")
        
        KiKPageObject.button2.tap()
        XCTAssert(KiKPageObject.button2.label == "X")
    }
    
    func test_CheckIfUserCannotTapButtonTwice() {
        
        KiKPageObject.button1.tap()
        KiKPageObject.button1.tap()
        
        assertSnapshot(matching: KiKPageObject.takeScreenShot(), as: .image)
    }
    
    func test_CheckIfUserCanWin() {
        KiKPageObject.winningGame()
        assertSnapshot(matching: KiKPageObject.takeScreenShot(), as: .image)
    }
    
    func test_CheckIfUserCanTie() {
        KiKPageObject.tieGame()
        assertSnapshot(matching: KiKPageObject.takeScreenShot(), as: .image)
    }
    

}
