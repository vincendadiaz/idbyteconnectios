//
//  MenuController.swift
//  Connected Economy
//
//  Created by M. Firza Pratama on 8/19/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Foundation
import UIKit

class MenuController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath,animated:true)
        
        if(indexPath.row==0)
        {
            self.revealViewController().revealToggleAnimated(true)
        }
        if(indexPath.row==3)
        {
            IDBytesManager.sharedInstance().requestManager().GET("/auth/logout", parameters: nil, success: { [weak self] (op, responseObject) -> Void in
                if(self != nil){
                    IDBytesManager.sharedInstance().logOut()
                
                    self!.dismissViewControllerAnimated(true, completion: nil)
                }
                }) { [weak self] (op, error) -> Void in
                    if(self != nil){
                    self!.view.makeToast("error")
                    }
            }
        }
    }
    
    
    
    
    // MARK: - Table view data source
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell
    
    // Configure the cell...
    
    return cell
    }
    */
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
