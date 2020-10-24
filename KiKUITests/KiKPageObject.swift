//
//  KiKPageObject.swift
//  KiKUITests
//
//  Created by Justyna Kowalkowska on 24/10/2020.
//

import Foundation
import XCTest

public struct KiKPageObject {
    //.buttons["0"]
    public static let button1 = XCUIApplication().buttons["0"]
    public static let button2 = XCUIApplication().buttons["1"]
    public static let button3 = XCUIApplication().buttons["2"]
    public static let button4 = XCUIApplication().buttons["3"]
    public static let button5 = XCUIApplication().buttons["4"]
    public static let button6 = XCUIApplication().buttons["5"]
    public static let button7 = XCUIApplication().buttons["6"]
    public static let button8 = XCUIApplication().buttons["7"]
    public static let button9 = XCUIApplication().buttons["8"]

    public static func winningGame() {
        KiKPageObject.button1.tap()
        KiKPageObject.button2.tap()
        KiKPageObject.button5.tap()
        KiKPageObject.button8.tap()
        KiKPageObject.button9.tap()
    }
    
    public static func tieGame() {
        KiKPageObject.button1.tap()
        KiKPageObject.button2.tap()
        KiKPageObject.button4.tap()
        KiKPageObject.button5.tap()
        KiKPageObject.button8.tap()
        KiKPageObject.button7.tap()
        KiKPageObject.button3.tap()
        KiKPageObject.button6.tap()
        KiKPageObject.button9.tap()
    }
    
    
    public static func takeScreenShot() -> UIImage {
        
        guard let screenShot = XCUIApplication().windows.firstMatch.screenshot().image.removingStatusBar else {
            return UIImage()
        }

        return screenShot
    }
    
}

extension UIImage {
    
    var removingStatusBar: UIImage? {
        guard let cgImage = cgImage else {
            return nil
        }
        
        let yOffSet = 70 * scale
        let rect = CGRect(
            x: 0,
            y: Int(yOffSet),
            width: cgImage.width,
            height: cgImage.height - Int(yOffSet)
        )
        
        if let croppedCGImage = cgImage.cropping(to: rect) {
            return UIImage(cgImage: croppedCGImage, scale: scale, orientation: imageOrientation)
        }
        
        return nil
    }
}

