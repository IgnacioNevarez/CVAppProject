//
//  CVPersonalProfilePresenter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

class CVPersonalProfilePresenter: CVPersonalProfilePresenterProtocol {
    
    weak var view: CVPersonalProfileViewProtocol?
    var interactor: CVPersonalProfileInteractorInputProtocol?
    var router: CVPersonalProfileRouterProtocol?
    
    func getItemsInSection() -> Int {
        
        return interactor?.getItemsInSection(section: 0) ?? 0
    }
    
    func getSizeForItem(indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 120
        } else {
            return 100
        }
    }
    
    func getCandidatePhoto() -> URL? {
        
        return interactor?.getCandidatePhoto()
    }
    
    func getCellIdentifier(indexPath: IndexPath) -> String {
        if indexPath.section == 0 {
            return CVAboutCell.identifier
        } else {
            return CVContactInfoCell.identifier
        }
    }
    
    func getAboutValue(indexPath: IndexPath) -> String {
        guard let interactor = interactor else { return "No Information available" }
        return interactor.getAboutValue(indexPath: indexPath)
    }
    
    func getValuesForContactItem(indexPath: IndexPath) -> ContactInfoResults {
        guard let interactor = interactor else { return ContactInfoResults(type: "Unkown", value: "Unkown") }
        return interactor.getValuesForContactItem(indexPath: indexPath)
    }
    
    func getItemsInSection(section: Int) -> Int {
        guard let interactor = interactor else { return 0 }
        return interactor.getItemsInSection(section: section)
    }
    
    func getSectionTitle(section: Int) -> String {
        if section == 0 {
            return  CVConstants.SectionTitles.aboutTitle
        } else {
            return CVConstants.SectionTitles.contactInfo
        }
    }
    
    func getSections() -> Int {
        return interactor?.getSections() ?? 0
    }
    
}

extension CVPersonalProfilePresenter: CVPersonalProfileInteractorOutputProtocol {
    
    
}
