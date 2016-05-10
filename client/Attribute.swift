//
//  Attribute.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class Attribute {
    var name : String
    var type : String
    var value : String?
    var primary : Bool = false
    var localization : AttributeLocalization
    
    init(name: String, type: String, localization: AttributeLocalization, value: String?, primary: Bool) {
        self.name = name
        self.type = type
        self.localization = localization
        self.value = value
        self.primary = primary
    }
    
    convenience init(name: String, type: String, localization: AttributeLocalization, value: String?) {
        self.init(name: name, type: type, localization: localization, value: value, primary: false)
    }
    
    convenience init(name: String, type: String, localization: AttributeLocalization) {
        self.init(name: name, type: type, localization: localization, value: nil, primary: false)
    }
    
}
