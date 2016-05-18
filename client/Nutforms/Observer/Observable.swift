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
    
    /**
     Registers Observer to event.
     
     - parameter event:    Name of the event.
     - parameter observer: The Observer to register.
     */
    func listen(event: String, observer: Observer) {
        self.observers[event]?.append(observer)
    }

    func unsubscribe(event: String, observer: Observer) {
        // TODO: implement
//        var indexToRemove: Int? = nil;
//        self.observers[event]?.enumerate().forEach({ (index: Int, element: Observer) in
//            if (element == observer) {
//                indexToRemove = index;
//            }
//        })
//        if (indexToRemove != nil) {
//            self.observers[event]?.removeAtIndex(indexToRemove!)
//        }
    }

    /**
     Triggers event represented by Action object on the Observable object.
     
     - parameter event:  Name of the event.
     - parameter action: The Action object.
     */
    func trigger(event: String, action: Action) {
        if self.observers[event] != nil {
            self.observers[event]?.forEach({ (observer) in
                observer.update(action)
            })
        }
    }

}
