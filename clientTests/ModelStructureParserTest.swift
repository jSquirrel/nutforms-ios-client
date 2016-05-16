//
//  ModelStructureParserTest.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import XCTest
@testable import client

class ModelStructureParserTest: XCTestCase {
    
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
        let parser = ModelStructureParser()
        
        parser.parse(
            [
                "attributes": [
                    [
                        "name": "id",
                        "type": "java.lang.Long",
                        "is_primary": "true"
                    ],
                    [
                        "name": "description",
                        "type": "java.lang.String",
                        "is_primary": "false"
                    ],
                    [
                        "name": "log",
                        "type": "java.lang.String",
                        "is_primary": "false"
                    ],
                ],
                "relationships": [
                    [
                        "name": "project",
                        "type": "toOne",
                        "target_class": "cz.cvut.fel.nutforms.example.model.Project"
                    ],
                ]
            ],
            modelBuilder: modelBuilder
        )
        
        XCTAssertTrue(modelBuilder.hasAttributeBuilder("id"))
        XCTAssertEqual("id", modelBuilder.getAttributeBuilder("id").name)
        XCTAssertEqual("java.lang.Long", modelBuilder.getAttributeBuilder("id").type)
        XCTAssertEqual(true, modelBuilder.getAttributeBuilder("id").primary)
        
        XCTAssertTrue(modelBuilder.hasAttributeBuilder("description"))
        XCTAssertEqual("description", modelBuilder.getAttributeBuilder("description").name)
        XCTAssertEqual("java.lang.String", modelBuilder.getAttributeBuilder("description").type)
        XCTAssertEqual(false, modelBuilder.getAttributeBuilder("description").primary)
        
        XCTAssertTrue(modelBuilder.hasAttributeBuilder("log"))
        XCTAssertEqual("log", modelBuilder.getAttributeBuilder("log").name)
        XCTAssertEqual("java.lang.String", modelBuilder.getAttributeBuilder("log").type)
        XCTAssertEqual(false, modelBuilder.getAttributeBuilder("log").primary)
        
        XCTAssertTrue(modelBuilder.hasRelationBuilder("project"))
        XCTAssertEqual("project", modelBuilder.getRelationBuilder("project").name)
        XCTAssertEqual("toOne", modelBuilder.getRelationBuilder("project").type)
        XCTAssertEqual(false, modelBuilder.getRelationBuilder("project").primary)
        XCTAssertEqual("cz.cvut.fel.nutforms.example.model.Project", modelBuilder.getRelationBuilder("project").targetClass)
    }
    
}
