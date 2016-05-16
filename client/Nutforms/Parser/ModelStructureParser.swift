//
//  ModelStructureParser.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class ModelStructureParser {
    
    func parse(data: [String:[[String:String]]], modelBuilder: ModelBuilder) {
        data.forEach({(type, values) in
            switch(type) {
            case "attributes":
                values.forEach({(attribute) in
                    let name = attribute["name"]!
                    let type = attribute["type"]!
                    let primary = attribute["is_primary"]!
                    
                    modelBuilder.getAttributeBuilder(name)
                        .setType(type)
                        .setPrimary(primary == "true")
                })
                break;
            case "relationships":
                values.forEach({(relation) in
                    let name = relation["name"]!
                    let type = relation["type"]!
                    let targetClass = relation["target_class"]!
                    
                    modelBuilder.getRelationBuilder(name)
                        .setTargetClass(targetClass)
                        .setType(type)
                        .setPrimary(false)
                })
                break;
            default:
                break;
            }
        })
    }

}
