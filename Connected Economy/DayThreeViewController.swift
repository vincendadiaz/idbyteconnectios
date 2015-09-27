//
//  DayThreeViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/23/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

class DayThreeViewController: UITableViewController {

    
    @IBAction func one(sender: UIButton)
    {
        let time = "09.30"
        let topic = "Opening Speech"
        let presenter = "Shinta Dhanuwardoyo, Chairwoman IDBYTE, Rudiantara, Minister of Communications and Informatics Indonesia"
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
        let time = "10.00"
        let topic = "The Principles on Connected eConomy"
        let presenter = "John Lagerling, VP Business Development Facebook Sandiaga Uno, Asosiasi Pedagang Pasar Seluruh Indonesia Alex Rusli, CEO, Indosat"
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
        let time = "11.00"
        let presenter = "Video : Tony Fernandes, CEO Airasia"
        let textToShare = "Come and visit IdByte in Pacific Place at " + time + " with " + presenter
        
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
        let time = "11.15"
        let topic = "Why Invest In Indonesia"
        let presenter = "Wilson Cuaca, East Ventures Ming Maa*, Softbank (tbc) Pietr Kemps*, Sequioa (tbc) Moderator The Jakarta Post"
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
        let time = "13.30"
        let topic = "How Tech Will Help Accelerate Indonesia Towards Excellent Education"
        let presenter = "Anies Baswedan, Ninister of Education Indonesia"
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
        let time = "14.00"
        let topic = "Big Byte in Big Cities"
        let presenter = "Tri Rismaharini, Mayor of Surabaya, Ridwal Kamil, Mayor of Bandung, Danny Pomanto, Mayor of Makassar, Dick Van Motman, CEO Dentsu Aegis Network SEA"
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
        let time = "16.15"
        let topic = "Transporting Grass Root Movement For A Great Economic Growth"
        let presenter = "Nadiem Kariem, Founder Gojek"
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
        let time = "15.45"
        let topic = "Connecting Creative Economy and Technology"
        let presenter = "Triawan Munaf, Chariman Agency of Creative Economy(BEKRAF)"
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
        let time = "15.45"
        let topic = "Connecting Creative Economy and Technology"
        let presenter = "Triawan Munaf, Chariman Agency of Creative Economy(BEKRAF)"
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
        let time = "16.15"
        let topic = "Technology and Media"
        let presenter = "Brian McWilliwams, Head of Analytics, Disney Research Zurich"
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
    @IBAction func eleven(sender: UIButton)
    {
        let textToShare = "Come and visit IdByte's Closing Remark in Pacific Place at 17.00"
        
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
