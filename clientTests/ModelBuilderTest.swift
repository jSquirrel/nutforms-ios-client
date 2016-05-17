//
//  ModelBuilderTest.swift
//  client
//
//  Created by Filip Klimeš on 16/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import XCTest
@testable import client

class ModelBuilderTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBuild() {
        let modelBuilder: ModelBuilder = ModelBuilder()
        modelBuilder.setName("name")
        modelBuilder.setContext("context")
        modelBuilder.addLayout(Layout(betweenFieldsSpacing: 20, labelToFieldSpacing: 20, order: [:]))
        modelBuilder.addRenderer(ModelRenderer())
        modelBuilder.addLocalization(ModelLocalization(formLabel: "form label", submitButtonLabel: "submit"))
        modelBuilder.addSubmit(Submit())
        let model = modelBuilder.build();
        XCTAssertEqual(model.name, "name")
        XCTAssertEqual(model.context, "context")
        XCTAssertEqual(model.layout.betweenFieldsSpacing, 20)
        XCTAssertEqual(model.layout.labelToFieldSpacing, 20)
        XCTAssertEqual(model.localization.formLabel, "form label")
        XCTAssertEqual(model.localization.submitButtonLabel, "submit")
    }
    
}
