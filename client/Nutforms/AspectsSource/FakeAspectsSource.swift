//
//  FakeAspectsSource.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation
import PromiseKit

/// Fetches static aspects, for testing purposes.
class FakeAspectsSource: AspectsSource {
    
    /**
     Fetches model structure metadata for entity class.
     
     - parameter entityName: Name of the entity class.
     
     - returns: Promise with the structure metadata.
     */
    func fetchClassMedadata(entityName: String) -> Promise<[String:[[String:String]]]> {
        return Promise<[String:[[String:String]]]>{ fulfill, reject in
            fulfill([
                "attributes": [
                    [
                        "name": "id",
                        "type": "java.lang.Long",
                        "is_primary": "true"
                    ],
                    [
                        "name": "description",
                        "type": "java.lang.String",
                        "is_primary": "false"
                    ],
                    [
                        "name": "log",
                        "type": "java.lang.String",
                        "is_primary": "false"
                    ],
                ],
                "relationships": [
                    [
                        "name": "project",
                        "type": "toOne",
                        "target_class": "cz.cvut.fel.nutforms.example.model.Project"
                    ],
                ]
                ])
        }
    }
    
    /**
     Fetches localization aspect data for entity class in locale and business context.
     
     - parameter entityName: Name of the entity class.
     - parameter locale:     Name of the locale.
     - parameter context:    Name of the business context.
     
     - returns: Promise with localization data.
     */
    func fetchLocalization(entityName: String, locale: String, context: String) -> Promise<[String: String]> {
        return Promise<[String: String]>{ fulfill, reject in
            fulfill([
                "form.label": "Report Bug",
                "form.submit.value": "Report",
                "form.id.label": "ID",
                "form.description.label": "Description",
                "form.log.label": "Log",
                "form.project.label": "Project",
            ])
        }
    }
    
    /**
     Fetches values for entity class instance.
     
     - parameter entityName: Name of the entity class.
     - parameter entityId:   Identifier of the entity.
     
     - returns: Promise with entity's values.
     */
    func fetchValues(entityName: String, entityId: Int?) -> Promise<[String: String]> {
        return Promise<[String: String]>{ fulfill, reject in
            fulfill([
                "id": "1",
                "description": "Bug #1",
                "log": "java.lang.NullPointerException in ...",
                "project": "1"
            ])
        }
    }
    
    /**
     Fetches layout aspect data.
     
     - parameter layout: Name of the layout.
     
     - returns: Promise with layout data.
     */
    func fetchLayout(layout: String) -> Promise<[String: String]> {
        return Promise<[String: String]>{ fulfill, reject in
            fulfill([:])
        }
    }
    
    /**
     Fetches widget data.
     
     - parameter name: Name of the widget.
     
     - returns: Widget values.
     */
    func fetchWidget(name: String) -> [String: String] {
        switch name {
        case "number-field":
            return [
                "type": "UITextField",
                "border_style": "UITextBorderStyle.RoundedRect",
                "keyboard_type": "UIKeyboardType.DecimalPad"
            ]
        case "text-field":
            return [
                "type": "UITextField",
                "border_style": "UITextBorderStyle.RoundedRect"
            ]
        case "label":
            return [
                "type": "UILabel"
            ]
        default:
            return [
                "type": "UITextField",
                "border_style": "UITextBorderStyle.RoundedRect"
            ]
        }
    }

}
