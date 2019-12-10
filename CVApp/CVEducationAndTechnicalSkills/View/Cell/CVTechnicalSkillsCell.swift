//
//  CVTechnicalSkillsCell.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 08/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVTechnicalSkillsCell: UITableViewCell {
    
    @IBOutlet weak var cvTechnicalSkillsTitle: UILabel!
    @IBOutlet weak var cvTechnicalSkillsValue: UILabel!
    
    
    static let identifier = "CVTechnicalSkillsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(technicalSkills: TechnicalSkillsResults) {
        cvTechnicalSkillsTitle.text = technicalSkills.skill
        cvTechnicalSkillsValue.text = technicalSkills.value
    }
}
