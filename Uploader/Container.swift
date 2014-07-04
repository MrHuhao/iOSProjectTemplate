//
//  Container.swift
//  Uploader
//
//  Created by mono on 7/3/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import Foundation

protocol IContainer {
    var managedObjectContext: NSManagedObjectContext { get }
    func childManagedObjectContext(key:String) -> NSManagedObjectContext
}

class Container : IContainer {
    // TODO: Typhoonなど使う
    var _managedObjectContext:NSManagedObjectContext?
    var _childManagedObjectContextDictionary: Dictionary<String, NSManagedObjectContext>?
    
    class var sharedInstance : Container {
        struct Static {
            static let instance = Container()
        }
        return Static.instance
    }
    
    var managedObjectContext:NSManagedObjectContext {
        get  {
            if let moc = _managedObjectContext? {
                return moc
            }
            MagicalRecord.setupCoreDataStack()
            _managedObjectContext = NSManagedObjectContext.MR_defaultContext()
            return _managedObjectContext!
        }
    }
    func childManagedObjectContext(key:String) -> NSManagedObjectContext {
        if let dict = _childManagedObjectContextDictionary? {
        } else {
            _childManagedObjectContextDictionary = Dictionary<String, NSManagedObjectContext>()
        }
        if let moc = _childManagedObjectContextDictionary![key]? {
            return moc
        }
        let moc = NSManagedObjectContext.MR_contextWithParent(self.managedObjectContext)
        if var dict = _childManagedObjectContextDictionary? {
            dict[key] = moc
        }
        return moc
    }
}