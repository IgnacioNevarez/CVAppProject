//
//  CVEducationCell.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 08/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVEducationCell: UITableViewCell {
    
    @IBOutlet weak var cvEducationImageView: UIImageView!
    @IBOutlet weak var cvEducationUniversityName: UILabel!
    @IBOutlet weak var cvEducationDegreeName: UILabel!
    @IBOutlet weak var cvEducationCompletionDate: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    static let identifier = "CVEducationCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(education: Education) {
        if let logoURL = education.universityLogoURL {
            cvEducationImageView.loadImageFromURL(urlImage: logoURL) {
                self.loadingIndicator.stopAnimating()
            }
        }
        cvEducationUniversityName.text = education.educationInfo.universityName
        cvEducationDegreeName.text = education.educationInfo.degreeName
        cvEducationCompletionDate.text = education.educationInfo.completionDate
    }
}
