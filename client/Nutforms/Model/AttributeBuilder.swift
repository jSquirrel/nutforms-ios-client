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

    /**
     ModelBuilder initializer.
     
     - parameter name: Name of the Attribute.
     
     - returns: The new AttributeBuilder instance.
     */
    init(name: String) {
        self.name = name
    }
    
    /**
     ModelBuilder initializer.
     
     - returns: The new AttributeBuilder instance.
     */
    convenience init() {
        self.init(name: "")
    }
    
    /**
     Sets name of the Attribute.
     
     - parameter name: The name.
     
     - returns: The AttributeBuilder.
     */
    func setName(name: String) -> AttributeBuilder {
        self.name = name
        return self
    }

    /**
     Sets type of the Attribute.
     
     - parameter type: The type.
     
     - returns: The AttributeBuilder.
     */
    func setType(type: String) -> AttributeBuilder {
        self.type = type
        return self
    }
    
    /**
     Sets value of the Attribtue instance.
     
     - parameter value: The value.
     
     - returns: The AttributeBuilder.
     */
    func setValue(value: String) -> AttributeBuilder {
        self.value = value
        return self
    }
    
    /**
     Sets primary attribute of the Attribute.
     
     - parameter primary: The primary parameter.
     
     - returns: The AttributeBuilder.
     */
    func setPrimary(primary: Bool) -> AttributeBuilder {
        self.primary = primary
        return self
    }
    
    /**
     Adds Localization to the Attribtue instance.
     
     - parameter localization: The Localization instance
     
     - returns: The AttributeBuilder.
     */
    func addLocalization(localization: AttributeLocalization) -> AttributeBuilder {
        self.localization = localization
        return self
    }
    
    /**
     Adds Renderer to the Attribtue instance.
     
     - parameter renderer: The Renderer instance.
     
     - returns: The AttributeBuilder.
     */
    func addRenderer(renderer: AttributeRenderer) -> AttributeBuilder {
        self.renderer = renderer
        return self
    }
    
    /**
     Builds the Attribute.
     
     - returns: The new Attribute instance.
     */
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
