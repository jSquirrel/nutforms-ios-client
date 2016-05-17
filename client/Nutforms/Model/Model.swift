//
//  Model.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation


class Model {
    
    var name: String
    var attributes: [String: Attribute]
    var relations: [String: Relation]
    var localization: ModelLocalization
    var renderer: ModelRenderer
    var layout: Layout
    var submit: Submit
    var context: String
    
    init(name: String, attributes: [String: Attribute], relations: [String: Relation], localization: ModelLocalization,
         renderer: ModelRenderer, layout: Layout, submit: Submit, context: String) {
        self.name = name
        self.attributes = attributes
        self.relations = relations
        self.localization = localization
        self.renderer = renderer
        self.layout = layout
        self.submit = submit
        self.context = context
        
        localization.bind(self)
        renderer.bind(self)
        layout.bind(self)
        
        attributes.forEach({(string, attribute) in attribute.bind(self)})
        relations.forEach({(string, relation) in relation.bind(self)})
    }

}
