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

    var targetClass: String
    
    init(name: String, type: String, localization: AttributeLocalization,
         value: String?, primary: Bool, renderer: AttributeRenderer, targetClass: String) {
        self.targetClass = targetClass
        super.init(name: name, type: type, localization: localization,
                   value: value, primary: primary, renderer: renderer)
    }

}
