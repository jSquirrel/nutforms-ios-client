//
//  LocalizationParser.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class LocalizationParser {

    func parse(data: [String:String], modelBuilder: ModelBuilder) {
        let formLabel = data["form.label"]
        let submitValue = data["form.submit.value"]
        
        modelBuilder.addLocalization(ModelLocalization(
            formLabel: formLabel!,
            submitButtonLabel: submitValue!
        ))
        
        modelBuilder.attributeBuilders.forEach({(name, attributeBuilder) in
            let label = data["form." + name + ".label"]
            if (label != nil) {
                attributeBuilder.addLocalization(AttributeLocalization(label: label!))
            }
        })
        
        modelBuilder.relationBuilders.forEach({(name, relationBuilder) in
            let label = data["form." + name + ".label"]
            if (label != nil) {
                relationBuilder.addLocalization(AttributeLocalization(label: label!))
            }
        })
    }

}
