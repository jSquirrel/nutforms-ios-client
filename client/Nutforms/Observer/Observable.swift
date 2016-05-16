//
//  Observable.swift
//  client
//
//  Created by Filip Klimeš on 16/05/16.
//  Copyright © 2016 cz.cvut.fel.nutforms. All rights reserved.
//

import Foundation

class Observable {

    var observers: [String: [Observer]] = [:]
    
    func listen(event: String, observer: Observer) {
        self.observers[event]?.append(observer)
    }

    func unsubscribe(event: String, observer: Observer) {}

    func trigger(event: String, action: Action) {}
    
}
