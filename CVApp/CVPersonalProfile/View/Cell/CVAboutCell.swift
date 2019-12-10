//
//  CVPersonalProfileTableViewCell.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 08/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVAboutCell: UITableViewCell {
    
    @IBOutlet weak var aboutLabel: UILabel!
    
    static let identifier = "CVAboutCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(about: String) {
        aboutLabel.text = about
    }
    
}

