//
//  Submit.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

/// Contains Submit logic for the Model
class Submit {

    /// Instance of the Model
    var model: Model?
    
    /**
     Binds the Submit to Model instance.
     
     - parameter model: The Model instance to bind to.
     */
    func bind(model: Model) {
        self.model = model
    }
    
    /**
     Submits data of the model.
     */
    func submit() {
        model!.trigger("model-submitted", action: ModelSubmittedAction(model: model!))
    }

}
