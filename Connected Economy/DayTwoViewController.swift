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
        let time = "13.30"
        let topic = "Mobile First Approach To Meet Indonesian Millennials"
        let presenter = "Erik Meijer, Strategic Brand Advisor Oreedoo"
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
        let time = "14.00"
        let topic = "Insights on Future e-Conomy"
        let presenter = "Chairil Tarunajaya, PWC Consulting"
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
        let time = "14.30"
        let topic = "Social as The Platform to Exchange"
        let presenter = "Roy Simangunsong, Head of Indonesia Twitter"
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
        let time = "15.00"
        let topic = "Monetizing Music v2.0"
        let presenter = "Jiro (JKT48 Dentsu), Jerry S Justianto, Director of Massima Group as Moderator"
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
        let time = "15.30"
        let topic = "Running a successful Business on Google Play"
        let presenter = "David Yin, Business Development Manager - Google Play Apps & Games, South East Asia & Australia"
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
        let time = "17.00"
        let topic = "Future Payment and Currency"
        let presenter = "Mandiri eCash, Veritrans, Bank Indonesia"
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
        let time = "17.30"
        let topic = "Fan Engagement In The World of Football"
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
