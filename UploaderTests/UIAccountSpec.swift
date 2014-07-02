//
//  UIAccountSpec.swift
//  Uploader
//
//  Created by mono on 6/29/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import Quick
import Nimble
import Uploader

class UIAccountSpec: QuickSpec {
    override func spec() {
        var target: UIAccount?
        beforeEach {
            target = UIAccount("hoge")
        }
        it("is friendly") {
            expect(target?._name).to.equal("hoge")
        }
    }
}