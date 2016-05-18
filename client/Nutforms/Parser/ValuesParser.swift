//
//  ValuesParser.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Parses entity values data and calls appropriate methods on ModelBuilder.
class ValuesParser {
    
    /**
     Parses values data and calls appropriate functions on ModelBuilder.
     
     - parameter data:         The model structure metadata.
     - parameter modelBuilder: The model builder.
     */
    func parse(data: [String:String], modelBuilder: ModelBuilder) {
        data.forEach({(name, value) in
            if (modelBuilder.hasAttributeBuilder(name)) {
                modelBuilder.getAttributeBuilder(name).setValue(value)
            } else if (modelBuilder.hasRelationBuilder(name)) {
                modelBuilder.getRelationBuilder(name).setValue(value)
            }
        })
    }
    
}
