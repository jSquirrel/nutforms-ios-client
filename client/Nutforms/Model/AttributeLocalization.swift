//
//  AttributeLocalization.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class AttributeLocalization {
    
    var label: String
    var attribute: Attribute?
    
    init(label: String) {
        self.label = label
    }
    
    func bind(attribute: Attribute) {
        self.attribute = attribute
    }

}
