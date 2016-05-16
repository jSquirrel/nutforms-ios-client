//
//  Nutforms.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import UIKit

class Nutforms {
    
    func generateForm(
        view: UIView,
        entityName: String,
        locale: String,
        entityId: Int,
        layout: String,
        widgetMapping: (Attribute)->String,
        context: String
        ) {
        // TODO: fetch aspects
        // TODO: fire events
        let model: Model = self.buildModel()
        model.renderer.render(view)
    }
    
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
