//
//  ModelBuilder.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class ModelBuilder {
    
    var name: String = ""
    var localization: ModelLocalization?
    var renderer: ModelRenderer?
    var layout: Layout?
    var submit: Submit?
    var context: String?
    var attributeBuilders: [String: AttributeBuilder] = [:]
    var relationBuilders: [String: RelationBuilder] = [:]
    var widgetMapping: ((Attribute) -> String)?
    var aspectsSource: AspectsSource?

    func getAttributeBuilder(name: String) -> AttributeBuilder {
        if (!hasAttributeBuilder(name)) {
            attributeBuilders[name] = AttributeBuilder(name: name)
        }
        return attributeBuilders[name]!
    }
    
    func hasAttributeBuilder(name: String) -> Bool {
        return attributeBuilders[name] != nil
    }
    
    func getRelationBuilder(name: String) -> RelationBuilder {
        if (!hasRelationBuilder(name)) {
            relationBuilders[name] = RelationBuilder(name: name)
        }
        return relationBuilders[name]!
    }
    
    func hasRelationBuilder(name: String) -> Bool {
        return relationBuilders[name] != nil
    }
    
    func setName(name: String) -> ModelBuilder {
        self.name = name
        return self
    }
    
    func setContext(context: String) -> ModelBuilder {
        self.context = context
        return self
    }
    
    func addLocalization(localization: ModelLocalization) -> ModelBuilder {
        self.localization = localization
        return self
    }
    
    func addRenderer(renderer: ModelRenderer) -> ModelBuilder {
        self.renderer = renderer
        return self
    }
    
    func addLayout(layout: Layout) -> ModelBuilder {
        self.layout = layout
        return self
    }
    
    func addSubmit(submit: Submit) -> ModelBuilder {
        self.submit = submit
        return self
    }
    
    func setWidgetMapping(widgetMapping: (Attribute) -> String) -> ModelBuilder {
        self.widgetMapping = widgetMapping
        return self
    }
    
    func setAspectsSource(aspectsSource: AspectsSource) -> ModelBuilder {
        self.aspectsSource = aspectsSource
        return self
    }
    
    func build() -> Model {
        var attributes: [String: Attribute] = [:]
        attributeBuilders.forEach({(name, builder) in
            builder.addRenderer(AttributeRenderer())
            attributes[name] = builder.build()
        })
        var relations: [String: Relation] = [:]
        relationBuilders.forEach({(name, builder) in
            builder.addRenderer(AttributeRenderer())
            relations[name] = builder.build()
        })
        
        return Model(
            name: name,
            attributes: attributes,
            relations: relations,
            localization: localization!,
            renderer: renderer!,
            layout: layout!,
            submit: submit!,
            context: context!,
            widgetMapping: widgetMapping!,
            aspectsSource: aspectsSource!
        );
    }
    
}
