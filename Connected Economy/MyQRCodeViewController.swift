//
//  MyQRCodeViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/21/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

class MyQRCodeViewController: UIViewController {
    var qrImg:CIImage?
    @IBOutlet weak var myQRCode: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scaleX = myQRCode.frame.size.width / qrImg!.extent.size.width
        let scaleY = myQRCode.frame.size.height / qrImg!.extent.size.height
        
        let transformedImage = self.qrImg!.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        self.myQRCode.image = UIImage(CIImage: transformedImage)
        
    }
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
