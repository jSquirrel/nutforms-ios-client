//
//  AttributeBuilder.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class AttributeBuilder {

    var name: String = ""
    var type: String = ""
    var value: String?
    var primary: Bool = false
    var localization: AttributeLocalization?
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
