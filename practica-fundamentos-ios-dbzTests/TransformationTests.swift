//
//  TransformationTests.swift
//  practica-fundamentos-ios-dbz
//
//  Created by Pablo Gómez on 5/1/23.
//

import XCTest
@testable import practica_fundamentos_ios_dbz

final class TransformationTests: XCTestCase {

    var transformation: Transformation!

    override func setUp() {
        super.setUp()
        transformation = Transformation(id: "4", name: "Goku", photo: "https://www.keepcoding.io", description: "Goku always win!")

    }

    override func tearDown() {
        transformation = nil
        super.tearDown()
    }
    
    func testtransformationId() {
        XCTAssertNotNil(transformation.id)
        XCTAssertEqual(transformation.id, "4")
    }
    
    func testtransformationName() {
        XCTAssertNotNil(transformation.name)
        XCTAssertEqual(transformation.name, "Goku")
    }
    
    func testtransformationPhoto() {
        let url = URL(string:transformation.photo)
        XCTAssertNotNil(transformation.photo)
        XCTAssertEqual(transformation.photo, "https://www.keepcoding.io")
        XCTAssertNotNil(url)
    }
    
    func testtransformationDescription() {
        XCTAssertNotNil(transformation.description)
        XCTAssertEqual(transformation.description, "Goku always win!")
    }
    

}
