//
//  Account.swift
//  Uploader
//
//  Created by mono on 6/29/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import Foundation

class Account: NSManagedObject {
    class func MR_entityName() -> String {
        return "Account"
    }
    @NSManaged
    var name: String
}