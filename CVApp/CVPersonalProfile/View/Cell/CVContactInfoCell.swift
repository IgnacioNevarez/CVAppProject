//
//  CVContactInfocell.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 08/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVContactInfoCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var contactInfoLabel: UILabel!
    
    static let identifier = "CVContactInfoCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(contactInfo: ContactInfoResults) {
        print(contactInfo.value)
        iconImage.image = UIImage(named: contactInfo.type)
        contactInfoLabel.text = contactInfo.value
    }
    
}
