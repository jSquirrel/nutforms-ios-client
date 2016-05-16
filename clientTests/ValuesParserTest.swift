//
//  ValuesParserTest.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import XCTest
@testable import client

class ValuesParserTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testParse() {
        
        let modelBuilder = ModelBuilder()
        modelBuilder.getAttributeBuilder("id")
        modelBuilder.getAttributeBuilder("description")
        modelBuilder.getAttributeBuilder("log")
        modelBuilder.getRelationBuilder("project")
        
        
        let parser = ValuesParser()
        parser.parse(
            [
                "id": "1",
                "description": "desc",
                "log": "log",
                "project": "1"
            ],
            modelBuilder: modelBuilder
        )
        
        XCTAssertEqual("1", modelBuilder.getAttributeBuilder("id").value)
        XCTAssertEqual("desc", modelBuilder.getAttributeBuilder("description").value)
        XCTAssertEqual("log", modelBuilder.getAttributeBuilder("log").value)
        XCTAssertEqual("1", modelBuilder.getRelationBuilder("project").value)
    }
    
}
