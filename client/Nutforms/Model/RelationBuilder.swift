//
//  RelationBuilder.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Conteins logic for building instance of Relation
class RelationBuilder: AttributeBuilder {

    /// Name of the target class
    var targetClass: String?
    
    /**
     Sets target class of the Relation.
     
     - parameter targetClass: Name of the target class.
     
     - returns: The RelationBuilder instance.
     */
    func setTargetClass(targetClass: String) -> RelationBuilder {
        self.targetClass = targetClass
        return self
    }
    
    /**
     Builds the Relation.
     
     - returns: The built Relation instance.
     */
    override func build() -> Relation {
        return Relation(
            name: name,
            type: type,
            localization: localization!,
            value: value,
            primary: primary,
            renderer: renderer!,
            targetClass: targetClass!
        )
    }
    
}
