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
    @IBOutlet var accountTextView: UITextView
                            
    @IBOutlet var myImageView: UIImageView
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Container.sharedInstance.logger.log("didload")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
                
        launchCamera()
        
        coredataSample()
        
        
//        pfObjectSample()
//        loginToFacebook()
    }
    
    func coredataSample() {
        
        let moc = Container.sharedInstance.managedObjectContext
        self.accountTextView.text = "\(Account.MR_findAll().count)"
        
        self.bk_performBlockInBackground({a in
            let moc2 = Container.sharedInstance.childManagedObjectContext("hoge")
            let moc3 = Container.sharedInstance.childManagedObjectContext("hoge")
            let hoge = moc2 === moc3
            for i in 1..10 {
                let account = Account.MR_createInContext(moc) as Account
                account.name = "fuga"
            }
            moc.MR_saveOnlySelfWithCompletion({success, error in
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.accountTextView.text = "\(Account.MR_findAll().count)"})
                
                })
            }, afterDelay: 0)
    }
    
    func pfObjectSample() {
        let pfObject = PFObject(className: "Test")
        pfObject["hoge"] = "fuga"
        pfObject.save(nil)
    }
    
    func loginToFacebook() {
        
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
        
        Container.sharedInstance.apiClient.hoge { result in
            self.contentTextView.text = result
        }
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

