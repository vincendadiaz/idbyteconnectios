//
//  HomeController.swift
//  Connected Economy
//
//  Created by M. Firza Pratama on 8/19/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Foundation
import UIKit
import Mantle
import FBSDKLoginKit
import Toast

class HomeController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var darkView: UILabel!
    var userVar:User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let singleTap = UITapGestureRecognizer(target: self, action: Selector("tapDetected"))
        singleTap.numberOfTapsRequired = 1
        let singleTap2 = UITapGestureRecognizer(target: self, action: Selector("tapDetected"))
        singleTap2.numberOfTapsRequired = 1

        self.darkView.userInteractionEnabled = true
        self.darkView.addGestureRecognizer(singleTap2)

        self.profileImage.userInteractionEnabled = true
        self.profileImage.addGestureRecognizer(singleTap)
        
        
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        var url = "/users/" + IDBytesManager.sharedInstance().email
        IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op, responseObject) -> Void in
            if(self != nil){
                let user:User = MTLJSONAdapter.modelOfClass(User.self, fromJSONDictionary: responseObject as! [NSObject : AnyObject]) as! User
                print(responseObject)
                self?.userVar = user
                self?.nameLabel?.text = user.name
                self?.jobLabel?.text = user.jobPosition
                self?.companyLabel?.text = user.job
            
                self?.profileImage.fadeImageWithURL(user.photo)
            }
            }) { [weak self] (op, error) -> Void in
                if(self != nil){
                if(op != nil && op.response != nil && op.response.statusCode == 401)
                {
                    IDBytesManager.sharedInstance().logOut()
                    self!.dismissViewControllerAnimated(true, completion: nil)
                }else{
                    self!.view.makeToast("an error happened on getting profile", duration: 2.0 ,position: "bottom" )
                }
                }
        }
        

    }
    func tapDetected()
    {
        self.performSegueWithIdentifier("showMyProfile", sender: self)
    }

    @IBAction func connectionClicked(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Connections")
        let nvc = UINavigationController(rootViewController:vc)
        nvc.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nvc.navigationBar.barTintColor = UIColor(red: 240/255, green: 90/255, blue: 34/255, alpha: 1)
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        nvc.navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]
        self.revealViewController().setFrontViewController(nvc, animated:true)
    }
    
    @IBAction func leaderBoard(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Leaderboard")
        
        let nvc = UINavigationController(rootViewController:vc)
        nvc.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nvc.navigationBar.barTintColor = UIColor(red: 240/255, green: 90/255, blue: 34/255, alpha: 1)
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        nvc.navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]

        self.revealViewController().setFrontViewController(nvc, animated:true)

    }
    
    
    @IBAction func scheduleClicked(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Rundown")
        
        let nvc = UINavigationController(rootViewController:vc)
        nvc.navigationBar.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        nvc.navigationBar.barTintColor = UIColor(red: 240/255, green: 90/255, blue: 34/255, alpha: 1)
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        nvc.navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]

        self.revealViewController().setFrontViewController(nvc, animated:true)

    }
    
    @IBOutlet weak var leaderBoardClicked: UIButton!
    @IBOutlet weak var youConnections: UIButton!
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showMyProfile") {
            let vc: MyProfileViewController = segue.destinationViewController as! MyProfileViewController
            print(self.userVar)
            vc.user = self.userVar

        }
        super.prepareForSegue(segue ,sender: sender)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

