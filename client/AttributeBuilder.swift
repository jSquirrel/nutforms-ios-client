//
//  AttributeBuilder.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class AttributeBuilder {

    var name : String = ""
    var type : String = ""
    var value : String?
    var primary : Bool = false
    var localization : AttributeLocalization?

    func setName(name: String) {
        self.name = name
    }

    func setType(type: String) {
        self.type = type
    }
    
    func setValue(value: String) {
        self.value = value
    }
    
    func setPrimary(primary: Bool) {
        self.primary = primary
    }
    
    func addLocalization(localization: AttributeLocalization) {
        self.localization = localization
    }
    
    func build() -> Attribute {
        return Attribute(name: self.name, type: self.type, localization: self.localization!, value: self.value, primary: self.primary)
    }

}
