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
    var localization: ModelLocalization
    var renderer: ModelRenderer
    var layout: Layout
    var submit: Submit
    
    init(name: String, attributes: [String: Attribute], localization: ModelLocalization,
         renderer: ModelRenderer, layout: Layout, submit: Submit) {
        self.name = name
        self.attributes = attributes
        self.localization = localization
        self.renderer = renderer
        self.layout = layout
        self.submit = submit
        
        localization.bind(self)
        renderer.bind(self)
        layout.bind(self)
        
        attributes.forEach({(string, attribute) in attribute.bind(self)})
    }

}
