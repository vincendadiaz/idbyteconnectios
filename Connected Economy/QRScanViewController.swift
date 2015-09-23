//
//  QRScanViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/19/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import MTBBarcodeScanner

class QRScanViewController: UIViewController {

    @IBOutlet weak var myQRCode: UIImageView!
    var scanner:MTBBarcodeScanner?
    @IBAction func back(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    var qrImg:CIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //uncomment for QRSCAN
        
        
        var str:String = IDBytesManager.sharedInstance().email
        let data = str.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
        
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
        filter!.setValue(data, forKey: "inputMessage")
        filter!.setValue("Q", forKey: "inputCorrectionLevel")
        self.qrImg = filter!.outputImage
        
        
        let scaleX = myQRCode.frame.size.width / qrImg!.extent.size.width
        let scaleY = myQRCode.frame.size.height / qrImg!.extent.size.height
        
        let transformedImage = self.qrImg!.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        self.myQRCode.image = UIImage(CIImage: transformedImage)

    }
    override func viewWillAppear(animated:Bool)
    {
        super.viewWillAppear(animated)
        self.startScan()
        
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        //IDBytesManager.sharedInstance().requestManager().operationQueue.cancelAllOperations()
        if(self.scanner!.isScanning())
        {
            self.scanner!.stopScanning()
        }
        
    }

    
    func startScan()
    {
        self.scanner = MTBBarcodeScanner(previewView: self.view)

        self.scanner!.startScanningWithResultBlock { (var codes) -> Void in
            if(codes.count>0)
            {
            self.scanner!.stopScanning()
                if(codes[0].stringValue == "##fitinline")
                {
                    self.performSegueWithIdentifier("fitinline", sender: self)
                }else if(codes[0].stringValue == "##codnusantara")
                {
                    self.performSegueWithIdentifier("codnusantara", sender: self)

                }else if(codes[0].stringValue == "##veryfund")
                {
                    self.performSegueWithIdentifier("veryfund", sender: self)

                }else if(codes[0].stringValue == "##sasbuzz")
                {
                    self.performSegueWithIdentifier("sasbuzz", sender: self)

                }else if(codes[0].stringValue == "##kurawal")
                {
                    self.performSegueWithIdentifier("kurawal", sender: self)

                }else if(codes[0].stringValue == "##kakatu")
                {
                    self.performSegueWithIdentifier("kakatu", sender: self)

                }else if(codes[0].stringValue == "##pinjam.co.id")
                {
                    self.performSegueWithIdentifier("pinjam.co.id", sender: self)

                }else if(codes[0].stringValue == "##makanluar.com")
                {
                    self.performSegueWithIdentifier("makanluar.com", sender: self)

                }else{
            var params = ["email" : codes[0].stringValue]

            IDBytesManager.sharedInstance().requestManager().POST("/connections/", parameters: params, success: { [weak self] (op, responseObject) -> Void in
                    //self!.view.makeToast(codes[0].stringValue, duration: 2.0 ,position: "bottom" )
                if(self != nil){
                    self!.performSegueWithIdentifier("connected", sender: codes[0].stringValue)
                }
                }) { [weak self] (op, error) -> Void in
                    if(self != nil)
                    {
                        if(op.response.statusCode==404)
                    {
                        self!.view.makeToast("User not found", duration: 2.0 ,position: "bottom" )
                    }else if(op.response.statusCode==409)
                    {
                        self!.view.makeToast("User is already your connection ", duration: 2.0 ,position: "bottom" )
                    }else if(op.response.statusCode==503)
                    {
                        self!.view.makeToast("an error has happened", duration: 2.0 ,position: "bottom" )

                    }
                    self!.startScan()
                    }
                    }
                }
            }
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showMyQRCode") {
            let vc: MyQRCodeViewController = segue.destinationViewController as! MyQRCodeViewController
            vc.qrImg = self.qrImg
        }else if (segue.identifier == "connected") {
            let vc: CongratulationsViewController = segue.destinationViewController as! CongratulationsViewController
            vc.email = sender as! String
        }
        super.prepareForSegue(segue ,sender: sender)
    }
    
}
