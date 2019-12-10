//
//  CVWorkExperiencePresenter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

class CVWorkExperiencePresenter: CVWorkExperiencePresenterProtocol {
    
    weak var view: CVWorkExperienceViewProtocol?
    var interactor: CVWorkExperienceInteractorInputProtocol?
    var router: CVWorkExperienceRouterProtocol?
    
    func getSizeForItem(indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func getCellIdentifier(indexPath: IndexPath) -> String {
        return CVWorkExperienceCell.identifier
    }
    
    func getValuesForWorkExperience(indexPath: IndexPath) -> WorkExperience {
        guard let interactor = interactor else {
            let workExperienceResult = WorkExperienceResults(companyName: "unkwown", timeFrame: "unkwown", jobPosition: "unkwown", jobDescription: "unkwown", companyLogo: "unkwown")
            return WorkExperience(workExperienceInfo: workExperienceResult, companyLogoURL: nil) }
        return interactor.getWorkExperienceValues(indexPath: indexPath)
    }
    
    func getItemsInSection(section: Int) -> Int {
        guard let interactor = interactor else { return 0 }
        return interactor.getItemsInSection(section: section)
    }
    
    func getSectionTitle(section: Int) -> String {
        return CVConstants.SectionTitles.workExperienceTitle
    }
    
    func getSections() -> Int {
        return interactor?.getSections() ?? 0
    }
    
}

extension CVWorkExperiencePresenter: CVWorkExperienceInteractorOutputProtocol {
    
}

