//
//  DayOneTableViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/23/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//


class DayOneTableViewController: UITableViewController {
    
    @IBAction func one(sender: UIButton)
    {
        let time = "13.30"
        let topic = "Keynote Opening"
        let presenter = "Shinta Dhanuwardoyo, Chairwoman IDBYTE and Triawan Munaf, Chairman BEKRAF"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
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
    
    @IBAction func two(sender: UIButton)
    {
        let time = "13.50"
        let topic = "Importance of Private Sector to Support the Creative Economy"
        let presenter = "Alex Rusli, CEO Indosat"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
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
    
    @IBAction func three(sender: UIButton)
    {
        let time = "14.00"
        let topic = "IOT Innovation with Integrasia"
        let presenter = ""
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
    
    @IBAction func four(sender: UIButton)
    {
        let time = "14.30"
        let topic = "Handry Satriago, CEO, Indonesia, GE"
        let presenter = "Handry Satriago, CEO, Indonesia, GE and Daniel Rembeth, Markets Group Director of PWC as Moderator"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
    
    @IBAction func five(sender: UIButton)
    {
        let time = "15.00"
        let topic = "How Tech Reshapes Indonesian Culture and Consumption"
        let presenter = "Daniel Tumiwa, Chairman, idEA"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
    
    @IBAction func six(sender: UIButton)
    {
        let time = "15.30"
        let topic = "The First Step of Funding"
        let presenter = "Tugce Ergul from Angel Labs of Silicon Valley, Rachmad Imron of Dreadout, and Emtek. and Angelyn, Director of GEPI as Moderator"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
    
    @IBAction func seven(sender: AnyObject) {
        let time = "16.30"
        let topic = "Multi Channel Network"
        let presenter = "Bernhard Soebiakto, CMO, Kapanlagi Network"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
    
    @IBAction func eight(sender: UIButton)
    {
        let time = "17.00"
        let topic = "Connecting The Indonesian Tech Ecosystem to Silicon Valley"
        let presenter = "SVATA: Alex & Felice, Yudi Wanandi (Jakpost), Abraham Hidayat (SkyStar Capital), Fajrin (Bukalapak) and Moderator: Andi Sadha, CEO, Activate"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
    
    @IBAction func nine(sender: UIButton)
    {
        let time = "17.30"
        let topic = "Growing SME with eCommerce"
        let presenter = "Achmad Zaky, Founder-CEO, Bukalapak"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
    
    
    @IBAction func ten(sender: UIButton)
    {
        let time = "18.00"
        let topic = "Digital Video and Connected Consumer"
        let presenter = "Gautam Talwar, VP Partnerships, Makers Studio"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with topics " + topic + " by " + presenter
        
        
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
}
