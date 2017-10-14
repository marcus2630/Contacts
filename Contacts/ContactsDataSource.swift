//
//  ContactsDataSource.swift
//  Contacts
//
//  Created by Marcus Klausen on 13/10/2017.
//  Copyright © 2017 Marcus Klausen. All rights reserved.
//

import Foundation
import UIKit

class ContactsDataSource: NSObject, UITableViewDataSource {
    private var sectionedData: [[Contact]]
    let sectionTitles: [String]
    
    init(sectionedData: [[Contact]], sectionTitles: [String]) {
        self.sectionedData = sectionedData
        self.sectionTitles = sectionTitles
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionedData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        guard let contactCell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell else { fatalError() }
        
        let contact = sectionedData[indexPath.section][indexPath.row]
        
        contactCell.profileCity.text = contact.city
        contactCell.profileName.text = contact.firstName
        contactCell.profileImageView.image = contact.image
        
        
        // Remember to also check if isFavorite is false, otherwise reused cells may have stars from earlier favorited cells.
        if contact.isFavorite {
            contactCell.favoriteIcon.image = #imageLiteral(resourceName: "Star")
        } else {
            contactCell.favoriteIcon.image = nil
        }
        
        print("isFavorite: \(contact.isFavorite), section: \(indexPath.section), row: \(indexPath.row)")
        
        return contactCell
    }
    
    // MARK: - Helper Methods
    
    func object(at indexPath: IndexPath) -> Contact {
        return sectionedData[indexPath.section][indexPath.row]
    }
    
    func indexPath(for contact: Contact) -> IndexPath? {
        for (index, contacts) in sectionedData.enumerated() {
            if let indexOfContact = contacts.index(of: contact) {
                return IndexPath(row: indexOfContact, section: index)
            }
        }
        return nil
    }
    func updateContact(_ contact: Contact, at indexPath: IndexPath) {
        sectionedData[indexPath.section][indexPath.row] = contact
    }
    
}
