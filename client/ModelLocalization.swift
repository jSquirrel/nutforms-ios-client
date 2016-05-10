//
//  ModelLocalization.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class ModelLocalization {

    var formLabel: String
    var submitButtonLabel: String
    var model: Model?
    
    init(formLabel: String, submitButtonLabel: String) {
        self.formLabel = formLabel
        self.submitButtonLabel = submitButtonLabel
    }
    
    func bind(model: Model) {
        self.model = model
    }

}
