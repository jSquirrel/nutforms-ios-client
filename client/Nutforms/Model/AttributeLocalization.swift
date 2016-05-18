//
//  AttributeLocalization.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Localization of Attribute
class AttributeLocalization {
    
    /// Label of the attribute widget
    var label: String
    
    /// The Attribute
    var attribute: Attribute?
    
    /**
     Initializer of the AttributeLocalization.
     
     - parameter label: The label of Attribute.
     
     - returns: The new AttributeLocalization instance.
     */
    init(label: String) {
        self.label = label
    }
    
    /**
     Binds the AttributeLocalization to Attribute instance.
     
     - parameter attribute: The Attribute instance to bind to.
     */
    func bind(attribute: Attribute) {
        self.attribute = attribute
    }

}
