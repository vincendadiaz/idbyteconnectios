//
//  HomeConnectionsTableViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/19/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//
import Foundation
import UIKit
import Mantle

class HomeConnectionsTableViewController: UITableViewController {
    var user:NSArray = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(animated:Bool)
    {
        super.viewWillAppear(true)
        var url = "/connections/"+IDBytesManager.sharedInstance().email+"/5/0"
        IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op, responseObject) -> Void in
            if(self != nil)
            {
            do {
                try self!.user = MTLJSONAdapter.modelsOfClass(User.self, fromJSONArray: responseObject as! [AnyObject])
                
            } catch {
            }
            self!.tableView.reloadData()
            }
            
            }) { [weak self] (op, error) -> Void in
        }

    }
    
    /*override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        IDBytesManager.sharedInstance().requestManager().operationQueue.cancelAllOperations()
        
    };*/


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
        print(self.user)
        self.navigationController!
            .pushViewController(vc, animated: true)
    }

}
