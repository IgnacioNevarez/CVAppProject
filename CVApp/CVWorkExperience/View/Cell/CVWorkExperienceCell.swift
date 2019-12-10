//
//  CVWorkExperienceCell.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVWorkExperienceCell: UITableViewCell {
    
    @IBOutlet weak var cvWorkExperienceImageView: UIImageView!
    @IBOutlet weak var cvWorkExperienceCompanyName: UILabel!
    @IBOutlet weak var cvWorkExperienceJobPosition: UILabel!
    @IBOutlet weak var cvWorkExperienceTimeFrame: UILabel!
    @IBOutlet weak var cvWorkExperienceJobDescription: UILabel!
    @IBOutlet weak var cvWorkExperienceLoadingIndicator: UIActivityIndicatorView!
    
    static let identifier = "CVWorkExperienceCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(workExperience: WorkExperience) {
        
        if let companyLogoURL = workExperience.companyLogoURL {

            cvWorkExperienceImageView.loadImageFromURL(urlImage: companyLogoURL) {
                self.cvWorkExperienceLoadingIndicator.stopAnimating()
            }
        }
    
        cvWorkExperienceCompanyName.text = workExperience.workExperienceInfo.companyName
        cvWorkExperienceJobPosition.text = workExperience.workExperienceInfo.jobPosition
        cvWorkExperienceTimeFrame.text = workExperience.workExperienceInfo.timeFrame
        cvWorkExperienceJobDescription.text = workExperience.workExperienceInfo.jobDescription
    }
}
