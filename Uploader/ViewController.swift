//
//  ViewController.swift
//  Uploader
//
//  Created by mono on 6/29/14.
//  Copyright (c) 2014 mono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var _launched: Bool?
    @IBOutlet var contentTextView: UITextView
                            
    @IBOutlet var myImageView: UIImageView
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let moc = NSManagedObjectContext.MR_defaultContext()
        
        let account = Account.MR_createInContext(moc) as Account
        account.name = "fuga"
        moc.MR_saveToPersistentStoreAndWait()
        
        let pfObject = PFObject(className: "Test")
        pfObject["hoge"] = "fuga"
        pfObject.save(nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        launchCamera()
        
        let me = PFUser.currentUser()
        if (me) {
            let a = me.username
            println(me.username)
            if (PFFacebookUtils.isLinkedWithUser(me)) {
                let hoge = "";
            }
        }
        
        PFFacebookUtils.logInWithPermissions(["publish_actions"], block: {user, error in
            let me:PFUser? = user
            })
    }
    
    @IBAction func getButtonDidTap(sender: UIButton) {
        
        let manager = AFHTTPRequestOperationManager()
        manager.GET("http://ip.jsontest.com/", parameters: nil,
        success: {op, responseObject in
            let res = responseObject as Dictionary<String, String>
            let hoge = res["ip"]
            self.contentTextView.text = hoge
            }, failure: { op, error in
            
        })
        
    }
    func launchCamera() {
        if (_launched?) {
            return;
        }
        _launched = true
        if (!UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            return;
        }
        let pickerController = UIImagePickerController();
        pickerController.sourceType = .Camera;
        pickerController.bk_didFinishPickingMediaBlock = { ctrl, dict in
            let image: UIImage = dict[UIImagePickerControllerOriginalImage] as UIImage;
            self.myImageView.image = image;
            ctrl.dismissViewControllerAnimated(true, completion: {})
        }
        presentViewController(pickerController, animated: true, completion:{});
    }
}

