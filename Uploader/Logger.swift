//
//  Logger.swift
//  Uploader
//
//  Created by mono on 7/5/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import Foundation

protocol ILogger {
    func log(message: String)
}

class Logger: ILogger {
    
    class var sharedInstance : ILogger {
    struct Static {
        static let instance = Logger()
        }
        return Static.instance
    }
    
    func configure() {
        
    }
    
    func log(message: String) {
        println(message)
    }
}