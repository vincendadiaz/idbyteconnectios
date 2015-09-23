//
//  TodayLeaderBoardTableViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/23/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Mantle

class TodayLeaderBoardTableViewController: UITableViewController {
    var user:NSMutableArray = NSMutableArray()
    var data:NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        

        var components = calendar.components(NSCalendarUnit.Month , fromDate: date)
        
        let month = components.month
        components = calendar.components(NSCalendarUnit.Day, fromDate: date)

        let day = components.day
        
        
        var hari:String = "1"
        if(day == 30 && month == 9)
        {
            hari = "1"
        }
        if(day == 1 && month == 10)
        {
            hari = "2"
        }
        if(day == 2 && month == 10)
        {
            hari = "3"
        }
        var url = "/leaderboards/" + hari
        IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op, responseObject) -> Void in
            if(self != nil)
            {
                print(responseObject)
                self?.data = responseObject as! NSArray
                
                self!.getProfile()
                self!.tableView.reloadData()
            }
            
            }) { [weak self] (op, error) -> Void in
        }
        
    }
    override func viewWillAppear(animated:Bool)
    {
        super.viewWillAppear(true)
        
    }
    
    func getProfile()
    {
        for item in self.data {
            var temp = User()
            temp.name = "nil"
            self.user.addObject(temp)
        }
        for index in 0...self.data.count-1 {
            var tempurl = self.data[index]["email"] as! String
            var url = "/users/" + tempurl
            IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op, responseObject) -> Void in
                if(self != nil)
                {
                    print(responseObject)
                    let user:User = MTLJSONAdapter.modelOfClass(User.self, fromJSONDictionary: responseObject as! [NSObject : AnyObject]) as! User
                    self?.user[index] = user
                    self!.tableView.reloadData()
                }
                
                }) { [weak self] (op, error) -> Void in
            }
            
        }
        
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 130
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: LeaderBoardCell = tableView.dequeueReusableCellWithIdentifier("LeaderBoardCell", forIndexPath: indexPath) as! LeaderBoardCell
        var person:User = self.user[indexPath.row] as! User
        
        var conncetions :Int = self.data[indexPath.row]["point"] as! Int
        
        cell.connectionLabel.text = "\(conncetions)"
        if(person.name == "nil")
        {
            
            return cell
        }
        
        cell.photoImageView.fadeImageWithURLRounded(person.photo, UIImageView: cell.photoImageView)
        cell.namePhotoLabel.text = person.name
        cell.jobLabel.text = person.jobPosition
        cell.noLabel.text = String(indexPath.row + 1)
        cell.companyLabel.text = person.job
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
