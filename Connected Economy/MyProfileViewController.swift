//
//  MyProfileViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/22/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Mantle

class MyProfileViewController: UITableViewController {
    @IBOutlet weak var profileImageViewController: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    @IBOutlet weak var connectionLabe: UILabel!
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(self.user == nil)
        {
            print("mati aja")
        }else{
        self.nameLabel?.text = self.user!.name
        self.jobLabel?.text = self.user!.jobPosition
        self.companyLabel?.text = self.user!.job
        self.phoneLabel.text = self.user!.phone
        self.emailLabel.text = self.user!.email
        
        self.profileImageViewController.fadeImageWithURL(self.user!.photo)
        
        var url = "/connections/"+IDBytesManager.sharedInstance().email+"/3000/0"
        IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op, responseObject) -> Void in
            if(self != nil){
                
                var count: Int = responseObject.count
                self?.connectionLabe.text = "\(count) Connections"
            }
            
            }) { [weak self] (op, error) -> Void in
                
            }
        }
        
    }
   
    
    @IBAction func shareButtonClicked(sender: UIButton)
    {
        let textToShare = "Hi I Have " + self.connectionLabe.text!
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
