//
//  ModelLocalization.swift
//  client
//
//  Created by Filip Klimeš on 10/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Localization of the Model
class ModelLocalization {

    /// Label of the form
    var formLabel: String
    
    /// Label of the submit buttion
    var submitButtonLabel: String
    
    /// The Model
    var model: Model?
    
    /**
     ModelLocalization initializer.
     
     - parameter formLabel:         Label of the form
     - parameter submitButtonLabel: Label of the submit button
     
     - returns: The new ModelLocalization instance.
     */
    init(formLabel: String, submitButtonLabel: String) {
        self.formLabel = formLabel
        self.submitButtonLabel = submitButtonLabel
    }
    
    /**
     Binds the ModelLocalization to Model instance.
     
     - parameter model: The Model instance to bind to.
     */
    func bind(model: Model) {
        self.model = model
    }

}
