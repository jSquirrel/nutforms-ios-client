//
//  Nutforms.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import UIKit

/// Facade of Nutforms library for automatic generation of forms
class Nutforms {
    
    /**
        Generates form for given contextual parameters.
     
        - Parameters:
            - view: The UIView to bind the form to
            - entityName: Unique identifier of the entity
            - locale: Unique identifier of locale
            - entityId: Identifier of the entity
            - layout: Identifier of the layout
            - widgetMapping: Widget mapping function
            - context: Identifier of context
    */
    func generateForm(
        view: UIView,
        entityName: String,
        locale: String,
        entityId: Int?,
        layout: String,
        widgetMapping: (Attribute)->String,
        context: String
        ) {
        // TODO: fetch aspects
        // TODO: fire events
        let model: Model = self.buildModel()
        model.renderer.render(view)
    }

    /**
     Initializes a new bicycle with the provided parts and specifications.
     
     - Parameters:
     
     - Returns: Rich Model built upon contextual parameters
     */
    func buildModel() -> Model {
        
        let modelBuilder: ModelBuilder = ModelBuilder()
        
        // TODO: build model from parameters
        modelBuilder.setName("Issue")
        modelBuilder.addLocalization(ModelLocalization(
            formLabel: "Report Issue",
            submitButtonLabel: "Create"
            ))
        modelBuilder.addRenderer(ModelRenderer())
        modelBuilder.addLayout(Layout(
            betweenFieldsSpacing: 20,
            labelToFieldSpacing: 10,
            order: [1: "id", 2: "description", 3: "log"]
            ))
        
        // TODO: build attributes from parameters
        modelBuilder.addAttribute(Attribute(
            name: "id",
            type: "java.lang.Long",
            localization: AttributeLocalization(label: "ID"),
            value: nil,
            primary: true
            ))
        modelBuilder.addAttribute(Attribute(
            name: "description",
            type: "java.lang.String",
            localization: AttributeLocalization(label: "Description")
            ))
        modelBuilder.addAttribute(Attribute(
            name: "log",
            type: "java.lang.String",
            localization: AttributeLocalization(label: "Log")
            ))
        return modelBuilder.build()
    }

}
