//
//  FakeAspectsSource.swift
//  client
//
//  Created by Filip Klimeš on 17/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class FakeAspectsSource: AspectsSource {
    
    func fetchClassMedadata(entityName: String) -> [String:[[String:String]]] {
        return [
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
        ]
    }
    
    func fetchLocalization(entityName: String, locale: String, context: String) -> [String: String] {
        return [
            "form.label": "Report Bug",
            "form.submit.value": "Report",
            "form.id.label": "ID",
            "form.description.label": "Description",
            "form.log.label": "Log",
            "form.project.label": "Project",
        ]
    }
    
    func fetchValues(entityName: String, entityId: Int?) -> [String: String] {
        return [
            "id": "1",
            "description": "desc",
            "log": "log",
            "project": "1"
        ]
    }
    
    func fetchLayout(layout: String) -> [String: String] {
        return [:]
    }

}
