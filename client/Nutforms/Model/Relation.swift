//
//  Relation.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Relation of Rich Model
class Relation: Attribute {

    /// Name of the target class
    var targetClass: String
    
    /**
     Relation initializer.
     
     - parameter name:         Name of the Relation.
     - parameter type:         Type of the Relation.
     - parameter localization: Localization of the Relation.
     - parameter value:        Value of the Relation.
     - parameter primary:      Is the Relation primary?
     - parameter renderer:     Rendered of the Relation.
     - parameter targetClass:  Target class of the realation.
     
     - returns: The new Relation instance.
     */
    init(name: String, type: String, localization: AttributeLocalization,
         value: String?, primary: Bool, renderer: AttributeRenderer, targetClass: String) {
        self.targetClass = targetClass
        super.init(name: name, type: type, localization: localization,
                   value: value, primary: primary, renderer: renderer)
    }

}
