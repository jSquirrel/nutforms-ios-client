//
//  RelationBuilder.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class RelationBuilder: AttributeBuilder {

    var targetClass: String?
    
    func setTargetClass(targetClass: String) {
        self.targetClass = targetClass
    }
    
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
