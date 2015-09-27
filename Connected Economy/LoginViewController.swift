//
//  LoginViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/21/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import FBSDKLoginKit
import FBSDKCoreKit

class LoginViewController: UIViewController {

    @IBAction func btnFBLoginPressed(sender: AnyObject) {
        var fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager .logInWithReadPermissions(["email"], handler: { (result, error) -> Void in
            if (error == nil){
                self.getFBUserData()
                fbLoginManager.logOut()
            }else
            {
                self.view.makeToast("error")
            }
        })
    }
    
   
    var urlPhoto : String?
    var name : String?
    var email : String?
    var fbId : String?


    
    
    func getFBUserData(){
        if((FBSDKAccessToken.currentAccessToken()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
                if (error == nil){
                    print(result["email"])
                    let val = result["email"]!
                    if(val == nil)
                    {
                        self.urlPhoto = result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as! String
                        self.name = result["name"] as! String
                        self.fbId = result["id"] as! String
                        self.email = ""
                        self.performSegueWithIdentifier("register", sender: self)
                    }else{
                    //var params: NSDictionary = ["keywords" : self.keyword!]
                    var email:String = result["email"] as! String
                    IDBytesManager.sharedInstance().email = email
                    var params = ["email" :email , "password" : "123456", "grant_type" : "password"]
                    self.urlPhoto = result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as! String
                    self.name = result["name"] as! String
                    self.fbId = result["id"] as! String
                    self.email = email
                    IDBytesManager.sharedInstance().requestManager().POST("/auth/login", parameters: params, success: { [weak self] (op, responseObject) -> Void in
                        if(self != nil){
                            IDBytesManager.sharedInstance().token = "Bearer " + (responseObject["token"] as! String)
                            IDBytesManager.sharedInstance().saveCache()
                            self!.performSegueWithIdentifier("loginSuccess", sender: self)
                        }
                        }) { [weak self] (op, error) -> Void in
                            if(self != nil){
                            if(op.response.statusCode==401)
                            {
                                self!.performSegueWithIdentifier("register", sender: self)
                            }else
                            {
                                self!.view.makeToast("error")
                                }
                            }
                        }
                    }

                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated:Bool)
    {
        super.viewDidAppear(true)
        if( IDBytesManager.sharedInstance().loadCache() != nil)
        {
            self.performSegueWithIdentifier("loginSuccess", sender: self)
        }
        
    }
    
    
    @IBAction func dontHaveFB(sender: AnyObject) {
        self.urlPhoto = "http://i108.photobucket.com/albums/n11/ridwan_arvi/10506738_10150004552801856_220367501106153455_o.jpg"
        self.name = "No Name"
        self.fbId = "nofb"
        self.email = ""
        self.performSegueWithIdentifier("register", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "register") {
            let nvc: UINavigationController = segue.destinationViewController as! UINavigationController
            let vc: RegisterViewController = nvc.topViewController as! RegisterViewController
            vc.name = self.name
            vc.fbId = self.fbId
            vc.email = self.email
            vc.urlPhoto = self.urlPhoto
            
        }
        super.prepareForSegue(segue ,sender: sender)
    }
    
    
}
