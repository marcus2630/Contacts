//
//  ContactDetailController.swift
//  Contacts
//
//  Created by Marcus Klausen on 07/10/2017.
//  Copyright © 2017 Marcus Klausen. All rights reserved.
//

import UIKit

class ContactDetailController: UITableViewController {

    var contact: Contact?
    
    //Outlets
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    
    
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var emailAddress: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func configureView() {
        guard let contact = contact else { return }
        
        phoneNumber.text = contact.phone
        emailAddress.text = contact.email
        streetAddress.text = contact.street
        city.text = contact.city
        region.text = contact.state
        zipCode.text = contact.zip
        contactName.text = "\(contact.firstName) \(contact.lastName)"
        profileView.image = contact.image
    }


}
