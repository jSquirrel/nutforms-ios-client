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
    
    var aspectsSource: AspectsSource
    
    init(aspectsSource: AspectsSource) {
        self.aspectsSource = aspectsSource
    }
    
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
        let model: Model = self.buildModel(
            aspectsSource.fetchClassMedadata(entityName),
            localization: aspectsSource.fetchLocalization(entityName, locale: locale, context: context),
            values: aspectsSource.fetchValues(entityName, entityId: entityId),
            layout: aspectsSource.fetchLayout(layout),
            entityName: entityName,
            context: context
        )
        model.renderer.render(view)
    }

    /**
     Initializes a new bicycle with the provided parts and specifications.
     
     - Parameters:
     
     - Returns: Rich Model built upon contextual parameters
     */
    func buildModel(
        modelStructure: [String:[[String:String]]],
        localization: [String: String],
        values: [String: String],
        layout: [String: String],
        entityName: String,
        context: String
        ) -> Model {
        
        let modelBuilder = ModelBuilder()
        let modelStructureParser = ModelStructureParser()
        let localizationParser = LocalizationParser()
        let valuesParser = ValuesParser()
        
        modelStructureParser.parse(modelStructure, modelBuilder: modelBuilder)
        localizationParser.parse(localization, modelBuilder: modelBuilder)
        valuesParser.parse(values, modelBuilder: modelBuilder)
        
        modelBuilder
            .setName(entityName)
            .setContext(context)
            .addRenderer(ModelRenderer())
            .addLayout(Layout(
                betweenFieldsSpacing: 20,
                labelToFieldSpacing: 10,
                order: [
                    1: "id",
                    2: "description",
                    3: "log",
                    4: "project"
                ]
            ))
            .addSubmit(Submit())

        return modelBuilder.build()
    }

}
