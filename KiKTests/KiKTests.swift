//
//  KiKTests.swift
//  KiKTests
//
//  Created by Justyna Kowalkowska on 22/10/2020.
//

import XCTest
@testable import KiK

class KiKTests: XCTestCase {

    //system under test
    var sut: KiKViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = KiKViewController()
        
        
    }

    override func tearDownWithError() throws {
        sut.model = Array(repeating: .none, count: 9)
    }

    func test_checkIfAllSymbolsAreTheSame() throws {

        let symbols: [Symbol] = Array(repeating: .X, count: 3)
        XCTAssert(sut.checkIfAllSymbolsAreTheSame(symbolLine: symbols))
    }

    func test_checkIfAllSymbolsAreTheSame_ShoudReturnFlaseIfContainsNone() throws {
        
        let symbols: [Symbol] = [.none, .O, .X]
        XCTAssertFalse(sut.checkIfAllSymbolsAreTheSame(symbolLine: symbols))
    }
    
    func test_checkIfEndGameReturnWin() {
        sut.model = Array(repeating: .X, count: 9)
        XCTAssertEqual(sut.gameEnded(), GameStateResult.winner)
    }

    func test_checkIfEndGameReturnTie() {
        sut.model = [ .O, .X, .O,
                      .X, .O, .X,
                      .X, .O, .X]
        XCTAssertEqual(sut.gameEnded(), GameStateResult.tie)
    }
    
    func test_checkIfEndGameReturnPlaying() {
        sut.model = [.none, .X, .O,
                     .X, .O, .X,
                     .X, .O, .O]
        XCTAssertEqual(sut.gameEnded(), GameStateResult.playing)
    }
    
    func test_checkIfLinesAreConvertedToSymbol() {
        sut.model = [.O, .O, .O,
                     .X, .X, .X,
                     .none, .none, .none]
        
        XCTAssertEqual(sut.convertLinesToSymbols(line: [0, 1, 2]),
                                                       [.O, .O, .O])
        XCTAssertEqual(sut.convertLinesToSymbols(line: [3 , 4, 5]),
                                                       [.X , .X, .X])
        XCTAssertEqual(sut.convertLinesToSymbols(line: [6, 7, 8]),
                                                       [.none, .none, .none])
        XCTAssertEqual(sut.convertLinesToSymbols(line: [1, 3, 6]),
                                                       [.O, .X, .none])
    }

}
