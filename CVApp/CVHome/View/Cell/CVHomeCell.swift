//
//  CVHomeCell.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVHomeCell: UICollectionViewCell {
    
    @IBOutlet weak var homeSectionImage: UIImageView!
    @IBOutlet weak var homeSectionTitle: UILabel!
    @IBOutlet weak var homeSectionTitleHeight: NSLayoutConstraint!
    
    static let identifier = "cvHomeCell"
    
    
    override func layoutSubviews() {
        super.layoutIfNeeded()
        self.layer.cornerRadius = 10
        homeSectionTitleHeight.constant = UIScreen.main.bounds.width - 144
        homeSectionImage.setImage()
    }
    
    func prepareCell(homeSections: HomeSections, width: CGFloat) {
        homeSectionTitle.text = homeSections.title
        homeSectionImage.image = UIImage(named: homeSections.image)
    }
}
