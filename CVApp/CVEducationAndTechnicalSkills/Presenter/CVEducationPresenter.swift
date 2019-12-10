//
//  CVEducationPresenter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

class CVEducationPresenter: CVEducationPresenterProtocol {
    
    weak var view: CVEducationViewProtocol?
    var interactor: CVEducationInteractorInputProtocol?
    var router: CVEducationRouterProtocol?
    
    func getSizeForItem(indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 150
        } else {
            return 120
        }
    }
    
    func getCellIdentifier(indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return CVEducationCell.identifier
        } else {
            return CVTechnicalSkillsCell.identifier
        }
    }
    
    func getValuesForEducation(indexPath: IndexPath) -> Education {
        guard let interactor = interactor else {
            let educationResult = EducationResults(degreeName: "Unkown", completionDate: "Unkown", universityName: "Unkown", universityLogo: nil)
            return Education(educationInfo: educationResult, universityLogoURL: nil)
        }
        return interactor.getEducationValues(indexPath: indexPath)
    }
    
    func getValuesForTechnicalSkills(indexPath: IndexPath) -> TechnicalSkillsResults {
        guard let interactor = interactor else { return TechnicalSkillsResults(skill: "Unkown", value: "Unkown") }
        return interactor.getTechnicalSkillsValues(indexPath: indexPath)
    }
    
    func getItemsInSection(section: Int) -> Int {
        guard let interactor = interactor else { return 0 }
        return interactor.getItemsInSection(section: section)
    }
    
    func getSectionTitle(section: Int) -> String {
        if section == 0 {
            return CVConstants.SectionTitles.educationTitle
        } else {
            return CVConstants.SectionTitles.technicalSkillsTitle
        }
    }
    
    func getSections() -> Int {
        return interactor?.getSections() ?? 0
    }
    
}

extension CVEducationPresenter: CVEducationInteractorOutputProtocol {
    
    
}
