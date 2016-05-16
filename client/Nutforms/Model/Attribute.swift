//
//  Attribute.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Attribute of Rich Model
class Attribute: Observable {
    var name: String
    var type: String
    var value: String?
    var primary: Bool = false
    var localization: AttributeLocalization
    var renderer: AttributeRenderer
    var model: Model?
    
    init(name: String, type: String, localization: AttributeLocalization,
         value: String?, primary: Bool, renderer: AttributeRenderer) {
        self.name = name
        self.type = type
        self.localization = localization
        self.value = value
        self.primary = primary
        self.renderer = renderer
    }
    
    convenience init(name: String, type: String, localization: AttributeLocalization,
                     value: String?, renderer: AttributeRenderer) {
        self.init(name: name, type: type, localization: localization,
                  value: value, primary: false, renderer: renderer)
    }
    
    convenience init(name: String, type: String, localization: AttributeLocalization,
                     renderer: AttributeRenderer) {
        self.init(name: name, type: type, localization: localization,
                  value: nil, primary: false, renderer: renderer)
    }
    
    func bind(model: Model) {
        self.model = model
    }
    
    func setValue(value: String?) {
        self.value = value;
        self.trigger("value-changed", action: AttributeAction(attribute: self))
    }
    
}
