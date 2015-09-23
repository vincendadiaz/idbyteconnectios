//
//  CongratulationsViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/22/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Mantle

class CongratulationsViewController: UIViewController {
    
    @IBOutlet weak var profileImageViewController: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    var email:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        var url = "/users/" + self.email!
        IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op, responseObject) -> Void in
            if(self != nil){let user:User = MTLJSONAdapter.modelOfClass(User.self, fromJSONDictionary: responseObject as! [NSObject : AnyObject]) as! User
            self?.nameLabel?.text = user.name
            self?.jobLabel?.text = user.jobPosition
            self?.companyLabel?.text = user.job
            
                self?.profileImageViewController.fadeImageWithURL(user.photo)}
            }) { [weak self] (op, error) -> Void in
                if(self != nil){
                self!.view.makeToast("an error happened on getting profile", duration: 2.0 ,position: "bottom" )
                }
        }

        
    }
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        let textToShare = "Hi I have connected with " + self.nameLabel!.text!
        
        if let myWebsite = NSURL(string: "http://id-byte.com//")
        {
            let objectsToShare = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            if activityVC.respondsToSelector("popoverPresentationController") {
                // iOS8
                if( activityVC.popoverPresentationController != nil)
                {
                    activityVC.popoverPresentationController!.sourceView = self.view
                }
            }
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
   

    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
