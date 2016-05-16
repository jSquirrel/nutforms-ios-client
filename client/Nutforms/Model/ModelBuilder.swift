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

    func setName(name: String) {
        self.name = name
    }
    
    func addAttribute(attribute: Attribute) {
        // TODO: check if attribute exists?
        self.attributes[attribute.name] = attribute
    }
    
    func addLocalization(localization: ModelLocalization) {
        self.localization = localization
    }
    
    func addRenderer(renderer: ModelRenderer) {
        self.renderer = renderer
    }
    
    func addLayout(layout: Layout) {
        self.layout = layout
    }
    
    func build() -> Model {
        return Model(
            name: self.name,
            attributes: self.attributes,
            localization: self.localization!,
            renderer: self.renderer!,
            layout: self.layout!
        );
    }
    
}
