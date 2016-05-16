//
//  LocalizationParserTest.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import XCTest
@testable import client

class LocalizationParserTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPase() {
        
        func testParse() {
            
            let modelBuilder = ModelBuilder()
            modelBuilder.getAttributeBuilder("id")
            modelBuilder.getAttributeBuilder("description")
            modelBuilder.getAttributeBuilder("log")
            modelBuilder.getRelationBuilder("project")
            
            
            let parser = LocalizationParser()
            parser.parse(
                [
                    "form.label": "form label",
                    "form.submit.value": "submit",
                    "form.id.label": "ID",
                    "form.description.label": "Description",
                    "form.log.label": "Log",
                    "form.project.label": "Project",
                ],
                modelBuilder: modelBuilder
            )
            
            XCTAssertEqual("form label", modelBuilder.localization!.formLabel)
            XCTAssertEqual("submit", modelBuilder.localization?.submitButtonLabel)
            XCTAssertEqual("ID", modelBuilder.getAttributeBuilder("id").localization!.label)
            XCTAssertEqual("Description", modelBuilder.getAttributeBuilder("description").localization!.label)
            XCTAssertEqual("Log", modelBuilder.getAttributeBuilder("log").localization!.label)
            XCTAssertEqual("Project", modelBuilder.getRelationBuilder("project").localization!.label)
        }
    }
    
}
