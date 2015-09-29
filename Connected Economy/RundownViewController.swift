//
//  RundownViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/18/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Foundation
import UIKit
class RundownViewController: UIViewController {
    
    var containerTabBarController:UITabBarController!

    @IBAction func changeTab(sender: AnyObject) {
        self.containerTabBarController.selectedIndex = sender.selectedSegmentIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "embedTab") {
            self.containerTabBarController = segue.destinationViewController as! UITabBarController
        }
        super.prepareForSegue(segue ,sender: sender)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
}
