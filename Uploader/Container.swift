//
//  Container.swift
//  Uploader
//
//  Created by mono on 7/3/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import Foundation

class Container {
    // あとで https://github.com/hpique/SwiftSingleton
    var _managedObjectContext:NSManagedObjectContext?
    
    init() {
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
}