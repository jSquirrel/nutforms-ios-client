//
//  AttributeValueChangedAction.swift
//  client
//
//  Created by Filip Klimeš on 18/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Action triggered when an Attribute changes its value
class AttributeValueChangedAction: AttributeAction {
    
    ///  The Attribute
    var attribute: Attribute

    init(attribute: Attribute) {
        self.attribute = attribute
    }
    
}
