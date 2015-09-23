//
//  RegisterViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/22/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//


class RegisterViewController: UITableViewController,UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var positionTextField: UITextField!
    
    
    var params : AnyObject{
        return ["name" : self.name!, "password" : "123456", "email" : self.email!, "url_photo" : self.urlPhoto!, "job" : self.companyTextField.text!, "job_position" : self.positionTextField!.text!, "phone" : self.phoneTextField.text!, "twitter" : "twitter", "facebook" : self.fbId!, "grant_type":"password"] as! AnyObject
    }
    
    
    @IBAction func sumbit(sender: AnyObject) {
        IDBytesManager.sharedInstance().requestManager().POST("/auth/register", parameters: self.params, success: {[weak self] (op,responseObject) -> Void in
            if(self != nil){
                self!.login()
            }
            }) {[weak self] (op, error) -> Void in
                if(self != nil){
                self!.view.makeToast("error")
                }
        }
        

    }
    
    func login()
    {
        IDBytesManager.sharedInstance().requestManager().POST("/auth/login", parameters: params, success: { [weak self] (op, responseObject) -> Void in
            if(self != nil){
            IDBytesManager.sharedInstance().token = "Bearer " + (responseObject["token"] as! String)
            IDBytesManager.sharedInstance().saveCache()
            self!.performSegueWithIdentifier("loginSuccess", sender: self)
            }
            }) { [weak self] (op, error) -> Void in
                if(self != nil){
                self!.view.makeToast("error")
                }
        }
    }
    
    var urlPhoto:String?
    var fbId:String?
    var email:String?
    var name:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.fadeImageWithURL(NSURL(string:self.urlPhoto!))
        self.nameLabel.text = self.name
        self.emailTextField.text = self.email
        self.tableView.allowsSelection = false
        
        self.emailTextField.delegate = self
        self.phoneTextField.delegate = self
        self.companyTextField.delegate = self
        self.positionTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}