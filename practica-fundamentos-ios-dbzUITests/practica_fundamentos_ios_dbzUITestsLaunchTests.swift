//
//  practica_fundamentos_ios_dbzUITestsLaunchTests.swift
//  practica-fundamentos-ios-dbzUITests
//
//  Created by Pablo Gómez on 7/1/23.
//

import XCTest

final class practica_fundamentos_ios_dbzUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
