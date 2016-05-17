//
//  AspectsSource.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

protocol AspectsSource {

    func fetchClassMedadata(entityName: String) -> [String:[[String:String]]]
    
    func fetchLocalization(entityName: String, locale: String, context: String) -> [String: String]
    
    func fetchValues(entityName: String, entityId: Int?) -> [String: String]
    
    func fetchLayout(layout: String) -> [String: String]

}
