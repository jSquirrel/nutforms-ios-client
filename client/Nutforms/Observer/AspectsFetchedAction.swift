//
//  AspectsFetchedAction.swift
//  client
//
//  Created by Filip Klimeš on 18/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class AspectsFetchedAction: NutformsAction {
    
    var classMetadata: [String:[[String:String]]]
    var localization: [String: String]
    var values: [String: String]
    var layout: [String: String]
    
    init (classMetadata: [String:[[String:String]]], localization: [String: String], values: [String: String], layout: [String: String]) {
        self.classMetadata = classMetadata
        self.localization = localization
        self.values = values
        self.layout = layout
    }

}

