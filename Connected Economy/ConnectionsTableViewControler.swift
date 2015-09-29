//
//  ConnectionsTableViewControler.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/21/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//
import Foundation
import UIKit
import Mantle

class ConnectionsTableViewControler: UITableViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var user:NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        var url = "/connections/"+IDBytesManager.sharedInstance().email+"/3000/0"
        IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op, responseObject) -> Void in
            if(self != nil){
                
            do {
                try self!.user = MTLJSONAdapter.modelsOfClass(User.self, fromJSONArray: responseObject as! [AnyObject])
            } catch {
                self!.view.makeToast("an error happened durring geeting your connection ", duration: 2.0 ,position: "bottom" )
            }
            self!.tableView.reloadData()
            }
            
            }) { [weak self] (op, error) -> Void in
                if(self != nil){
                self!.view.makeToast("an error happened durring geeting your connection ", duration: 2.0 ,position: "bottom" )
                }
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.user.count
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 130
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: ConnectionTableViewCell = tableView.dequeueReusableCellWithIdentifier("ConnectionTableViewCell", forIndexPath: indexPath) as! ConnectionTableViewCell
        var person:User = self.user[indexPath.row] as! User
        
        cell.profileImage.fadeImageWithURLRounded(person.photo, UIImageView: cell.profileImage)
        cell.nameLabel.text = person.name
        cell.jobLabel.text = person.jobPosition
        cell.companyLabel.text = person.job
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("ConnectionProfileViewController") as! ConnectionProfileViewController
        vc.user = self.user[indexPath.row] as! User
        self.navigationController!
            .pushViewController(vc, animated: true)
    }
}
