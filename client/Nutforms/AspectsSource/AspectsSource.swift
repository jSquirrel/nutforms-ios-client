//
//  AspectsSource.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import PromiseKit

/**
 *  Source of aspect data.
 *  Provides methods for fetching them.
 */
protocol AspectsSource {

    /**
     Fetches model structure metadata for entity class.
     
     - parameter entityName: Name of the entity class.
     
     - returns: Promise with the structure metadata.
     */
    func fetchClassMedadata(entityName: String) -> Promise<[String:[[String:String]]]>
    
    /**
     Fetches localization aspect data for entity class in locale and business context.
     
     - parameter entityName: Name of the entity class.
     - parameter locale:     Name of the locale.
     - parameter context:    Name of the business context.
     
     - returns: Promise with localization data.
     */
    func fetchLocalization(entityName: String, locale: String, context: String) -> Promise<[String: String]>
    
    /**
     Fetches values for entity class instance.
     
     - parameter entityName: Name of the entity class.
     - parameter entityId:   Identifier of the entity.
     
     - returns: Promise with entity's values.
     */
    func fetchValues(entityName: String, entityId: Int?) -> Promise<[String: String]>
    
    /**
     Fetches layout aspect data.
     
     - parameter layout: Name of the layout.
     
     - returns: Promise with layout data.
     */
    func fetchLayout(layout: String) -> Promise<[String: String]>

    /**
     Fetches widget data.
     
     - parameter name: Name of the widget.
     
     - returns: Widget values.
     */
    func fetchWidget(name: String) -> [String: String]

}
