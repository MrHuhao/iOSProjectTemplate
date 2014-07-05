//
//  ApiClient.swift
//  Uploader
//
//  Created by mono on 7/5/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import Foundation

protocol IApiClient {
    func hoge(completed:(String?)->())
}

class ApiClient : IApiClient {
    
    class var sharedInstance : IApiClient {
    struct Static {
        static let instance = ApiClient()
        }
        return Static.instance
    }
    
    var _httpManager:AFHTTPSessionManager?
    
    var httpManager: AFHTTPSessionManager {
    get {
        if let manager = _httpManager? {
            return manager
        }
        _httpManager = AFHTTPSessionManager();
        return _httpManager!
    }
    }
    
    func hoge(completed:(String?)->()) {
        self.httpManager.GET("http://ip.jsontest.com/", parameters: nil,
            success: {op, responseObject in
                let res = responseObject as Dictionary<String, String>
                let hoge = res["ip"] as String?
                completed(hoge)
            }, failure: { op, error in
                
            })
    }
}