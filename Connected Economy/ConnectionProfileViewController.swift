//
//  ConnectionProfileViewController.swift
//  Connected Economy
//
//  Created by Ridwan Arvihafiz on 9/22/15.
//  Copyright © 2015 M. Firza Pratama. All rights reserved.
//

import Mantle
import AddressBook
import AddressBookUI
class ConnectionProfileViewController: UITableViewController {
    @IBOutlet weak var profileImageViewController: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var connectionLabel: UILabel!
    
    //CRASH!!!! ini gak tau kenapa kadang" crash
    let addressBookRef: ABAddressBook = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()

    var user:User?

    override func viewDidLoad() {
        super.viewDidLoad()
        if(self.user == nil)
        {
            print("mati kamu")
        }
        self.nameLabel?.text = self.user!.name
        self.jobLabel?.text = self.user!.jobPosition
        self.companyLabel?.text = self.user!.job
        self.phoneLabel.text = self.user!.phone
        self.emailLabel.text = self.user!.email
            
        self.profileImageViewController.fadeImageWithURL(self.user!.photo)
        /*let url = "/connections/count/" + self.user!.email

        IDBytesManager.sharedInstance().requestManager().GET(url, parameters: nil, success: { [weak self] (op,  responseObject) -> Void in
                if(self != nil){
                    self?.connectionLabel.text = responseObject as! String + " Connections"
                }
            }) { [weak self] (op, error) -> Void in
                if(self != nil){
                    self!.view.makeToast("an error happened on getting profile", duration: 2.0 ,position: "bottom" )
                }
        }*/
        
    }
    
    
    // MARK: - Address Book
    
    func addPetToContacts(petButton: UIButton) {
        
        if let petRecordIfExists: ABRecordRef = getPetRecord(self.user!) {
            displayContactExistsAlert(petRecordIfExists)
            return
        }
        
        let petRecord: ABRecordRef = makeAndAddPetRecord(self.user!)
        let contactAddedAlert = UIAlertController(title: "\(self.user!.name) was successfully added.",
            message: nil, preferredStyle: .Alert)
        contactAddedAlert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(contactAddedAlert, animated: true, completion: nil)
    }
    
    func getPetRecord(user: User) -> ABRecordRef? {
        let allContacts = ABAddressBookCopyArrayOfAllPeople(addressBookRef).takeRetainedValue() as Array
        var petContact: ABRecordRef?
        for record in allContacts {
            let currentContact: ABRecordRef = record
            let currentContactName = ABRecordCopyCompositeName(currentContact).takeRetainedValue() as String
            let petName = user.name
            if (currentContactName == petName) {
                print("found \(petName).")
                petContact = currentContact
            }
        }
        return petContact
    }
    
    func makeAndAddPetRecord(user: User) -> ABRecordRef {
        let petRecord: ABRecordRef = ABPersonCreate().takeRetainedValue()
        
        ABRecordSetValue(petRecord, kABPersonFirstNameProperty, user.name, nil)
        var data = UIImageJPEGRepresentation(self.profileImageViewController.image!, 0.7)

        ABPersonSetImageData(petRecord, data, nil)
        
        let phoneNumbers: ABMutableMultiValue = ABMultiValueCreateMutable(ABPropertyType(kABMultiStringPropertyType)).takeRetainedValue()
        ABMultiValueAddValueAndLabel(phoneNumbers, user.phone, kABPersonPhoneMainLabel, nil)
        ABRecordSetValue(petRecord, kABPersonPhoneProperty, phoneNumbers, nil)
        
        let emails: ABMutableMultiValue = ABMultiValueCreateMutable(ABPropertyType(kABPersonEmailProperty)).takeRetainedValue()
        ABMultiValueAddValueAndLabel(emails, user.email, kABOtherLabel, nil)
        ABRecordSetValue(petRecord, kABPersonEmailProperty, emails, nil)
        
        ABRecordSetValue(petRecord, kABPersonJobTitleProperty, user.jobPosition, nil)
        ABRecordSetValue(petRecord, kABPersonOrganizationProperty, user.job, nil)


        
        ABAddressBookAddRecord(addressBookRef, petRecord, nil)
        saveAddressBookChanges()
        
        return petRecord
    }
    
    func saveAddressBookChanges() {
        if ABAddressBookHasUnsavedChanges(addressBookRef){
            var err: Unmanaged<CFErrorRef>? = nil
            let savedToAddressBook = ABAddressBookSave(addressBookRef, &err)
            if savedToAddressBook {
                print("Successully saved changes.")
            } else {
                print("Couldn't save changes.")
            }
        } else {
            print("No changes occurred.")
        }
    }
    
    // MARK: - Permissions
    
    func promptForAddressBookRequestAccess(petButton: UIButton) {
        var err: Unmanaged<CFError>? = nil
        ABAddressBookRequestAccessWithCompletion(addressBookRef) {
            (granted: Bool, error: CFError!) in
            dispatch_async(dispatch_get_main_queue()) {
                if !granted {
                    // 1
                    print("Just denied")
                    self.displayCantAddContactAlert()
                } else {
                    // 2
                    print("Just authorized")
                    self.addPetToContacts(petButton)
                }
            }
        }
    }
    
    func openSettings() {
        let url = NSURL(string: UIApplicationOpenSettingsURLString)
        UIApplication.sharedApplication().openURL(url!)
    }
    
    // MARK: - Alerts
    
    func displayCantAddContactAlert() {
        let cantAddContactAlert = UIAlertController(title: "Cannot Add Contact",
            message: "You must give the app permission to add the contact first.",
            preferredStyle: .Alert)
        cantAddContactAlert.addAction(UIAlertAction(title: "Change Settings",
            style: .Default,
            handler: { action in
                self.openSettings()
        }))
        cantAddContactAlert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(cantAddContactAlert, animated: true, completion: nil)
    }
    
    func displayContactExistsAlert(petRecord: ABRecordRef) {
        let petFirstName = ABRecordCopyValue(petRecord, kABPersonFirstNameProperty).takeRetainedValue() as? String ?? "That pet"
        let contactExistsAlert = UIAlertController(title: "\(petFirstName) has already been added.",
            message: nil, preferredStyle: .Alert)
        contactExistsAlert.addAction(UIAlertAction(title: "Show Contact", style: .Default, handler: { action in
            let personViewController = ABPersonViewController()
            personViewController.displayedPerson = petRecord
            self.navigationController?.pushViewController(personViewController, animated: true)
        }))
        contactExistsAlert.addAction(UIAlertAction(title: "OK", style: .Cancel, handler: nil))
        presentViewController(contactExistsAlert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    
    @IBAction func tappedAddPetToContacts(petButton: UIButton) {
        let authorizationStatus = ABAddressBookGetAuthorizationStatus()
        
        switch authorizationStatus {
        case .Denied, .Restricted:
            //1
            print("Denied")
            displayCantAddContactAlert()
        case .Authorized:
            //2
            print("Authorized")
            addPetToContacts(petButton)
        case .NotDetermined:
            //3
            print("Not Determined")
            promptForAddressBookRequestAccess(petButton)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

