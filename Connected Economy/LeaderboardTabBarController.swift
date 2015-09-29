//
//  LeaderboardTabBarController.swift
//  Connected Economy
//
//  Created by M. Firza Pratama on 8/28/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Foundation
import UIKit

class LeaderboardTabBarController: UIViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    
    var containerTabBarController:UITabBarController!

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "embedTab") {
            self.containerTabBarController = segue.destinationViewController as! UITabBarController
        }
        super.prepareForSegue(segue ,sender: sender)
    }
    
    @IBAction func changeTab(sender: AnyObject) {
        self.containerTabBarController.selectedIndex = sender.selectedSegmentIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
}
