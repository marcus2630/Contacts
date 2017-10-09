//
//  ContactCell.swift
//  Contacts
//
//  Created by Marcus Klausen on 09/10/2017.
//  Copyright © 2017 Marcus Klausen. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var favoriteIcon: UIImageView!
    @IBOutlet weak var profileCity: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
