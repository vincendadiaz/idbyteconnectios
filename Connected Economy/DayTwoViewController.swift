//
//  DayTwoViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/23/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

class DayTwoViewController: UITableViewController {
    @IBAction func one(sender: UIButton)
    {
        let time = "13.00"
        let topic = "Mobile First Approach To Meet Indonesian Millenialls"
        let presenter = "Oreedoo"
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
        let time = "13.30"
        let topic = "Insights on Future e-Conomy"
        let presenter = "VP of PWC"
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
        let topic = "Social as The Platform to Exchange"
        let presenter = "Periscope"
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
        let topic = "Monetizing Music v2.0"
        let presenter = "Dentsu, AKB48, Warner Music, Guvera and Jerry S Justianto, Director of Massima Group as Moderator"
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
        let topic = "How to get your apps into the hands of users"
        let presenter = "Google Playstore"
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
        let topic = "eCommerce Accelerator Fireside Chat"
        let presenter = "Bukalapak, Traveloka, and Tiket"
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
    
    @IBAction func seven(sender: UIButton)
    {
        let time = "16.00"
        let topic = "Future Payment and Currency"
        let presenter = "Mandiri eCash, SevenEleven, Doku, Bank Indonesia"
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
        let time = "16.30"
        let topic = "Fans, Tech and Love"
        let presenter = "Samantha Chen, Regional Sponsorships Sales Manager, Manchester United Ltd"
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
