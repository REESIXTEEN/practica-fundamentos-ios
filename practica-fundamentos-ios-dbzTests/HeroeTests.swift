//
//  HeroeTests.swift
//  pruebaDosTests
//
//  Created by Pablo Gómez on 5/1/23.
//

import XCTest
@testable import practica_fundamentos_ios_dbz

final class HeroeTests: XCTestCase {
    
    var heroe: Heroe!

    override func setUp() {
        super.setUp()
        heroe = Heroe(id: "4", name: "Goku", photo: "https://www.keepcoding.io", description: "Goku always win!", favorite: false)

    }

    override func tearDown() {
        heroe = nil
        super.tearDown()
    }
    
    func testHeroeId() {
        XCTAssertNotNil(heroe.id)
        XCTAssertEqual(heroe.id, "4")
    }
    
    func testHeroeName() {
        XCTAssertNotNil(heroe.name)
        XCTAssertEqual(heroe.name, "Goku")
    }
    
    func testHeroePhoto() {
        let url = URL(string:heroe.photo)
        XCTAssertNotNil(heroe.photo)
        XCTAssertEqual(heroe.photo, "https://www.keepcoding.io")
        XCTAssertNotNil(url)
    }
    
    func testHeroeDescription() {
        XCTAssertNotNil(heroe.description)
        XCTAssertEqual(heroe.description, "Goku always win!")
    }
    
    func testHeroeFavorite() {
        XCTAssertNotNil(heroe.favorite)
        XCTAssertEqual(heroe.favorite, false)
    }
    


}
