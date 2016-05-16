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
    var attributes: [String: Attribute] = [:]
    var localization: ModelLocalization?
    var renderer: ModelRenderer?
    var layout: Layout?
    var submit: Submit?

    func setName(name: String) -> ModelBuilder {
        self.name = name
        return self
    }
    
    func addAttribute(attribute: Attribute) -> ModelBuilder {
        // TODO: check if attribute exists?
        self.attributes[attribute.name] = attribute
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
    
    func build() -> Model {
        return Model(
            name: name,
            attributes: attributes,
            localization: localization!,
            renderer: renderer!,
            layout: layout!,
            submit: submit!
        );
    }
    
}
