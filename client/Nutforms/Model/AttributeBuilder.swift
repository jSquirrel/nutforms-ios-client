//
//  AttributeBuilder.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Contains building logic for Attribute
class AttributeBuilder {

    /// Name of the Attribute
    var name: String = ""
    
    /// Type of the Attribute
    var type: String = ""
    
    /// Value of the Attribute
    var value: String?
    
    /// Is the Attribute primary key of the Model?
    var primary: Bool = false
    
    /// Localization of the Attribute
    var localization: AttributeLocalization?
    
    /// Renderer of the Attribtue
    var renderer: AttributeRenderer?

    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "")
    }
    
    func setName(name: String) -> AttributeBuilder {
        self.name = name
        return self
    }

    func setType(type: String) -> AttributeBuilder {
        self.type = type
        return self
    }
    
    func setValue(value: String) -> AttributeBuilder {
        self.value = value
        return self
    }
    
    func setPrimary(primary: Bool) -> AttributeBuilder {
        self.primary = primary
        return self
    }
    
    func addLocalization(localization: AttributeLocalization) -> AttributeBuilder {
        self.localization = localization
        return self
    }
    
    func addRenderer(renderer: AttributeRenderer) -> AttributeBuilder {
        self.renderer = renderer
        return self
    }
    
    func build() -> Attribute {
        return Attribute(
            name: name,
            type: type,
            localization: localization!,
            value: value,
            primary: primary,
            renderer: renderer!
        )
    }

}
