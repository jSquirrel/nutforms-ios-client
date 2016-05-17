//
//  Nutforms.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import UIKit
import PromiseKit

/// Facade of Nutforms library for automatic generation of forms
class Nutforms {
    
    var aspectsSource: AspectsSource
    
    init(aspectsSource: AspectsSource) {
        self.aspectsSource = aspectsSource
    }
    
    /**
     Generates form for given contextual parameters.
     
     - parameter view:          The UIView to bind the form to
     - parameter entityName:    Unique identifier of the entity
     - parameter locale:        Unique identifier of locale
     - parameter entityId:      Identifier of the entity
     - parameter layout:        Identifier of the layout
     - parameter widgetMapping: Widget mapping function
     - parameter context:       Identifier of context
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
        let classMetadataPromise = aspectsSource.fetchClassMedadata(entityName)
        let localizationPromise = aspectsSource.fetchLocalization(entityName, locale: locale, context: context)
        let valuesPromise = aspectsSource.fetchValues(entityName, entityId: entityId)
        let layoutPromise = aspectsSource.fetchLayout(layout)
        
        classMetadataPromise.then{ classMetadata in
            when(localizationPromise, valuesPromise, layoutPromise)
                .then{ localization, values, layout -> Void in
                    let model: Model = self.buildModel(
                        classMetadata,
                        localization: localization,
                        values: values,
                        layout: layout,
                        entityName: entityName,
                        context: context
                    )
                    model.renderer.render(view)
                }
            }
    }
    
    /**
     Builds Rich Model upon contextual parameters.
     
     - parameter modelStructure: Model structure metadata of entity class
     - parameter localization:   Localization data
     - parameter values:         Values of the entity
     - parameter layout:         Layout data
     - parameter entityName:     Name of the entity class
     - parameter context:        Name of the business context
     
     - returns: Rich Model built upon the contextual parameters
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
            // TODO: load layout params from real layout
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
