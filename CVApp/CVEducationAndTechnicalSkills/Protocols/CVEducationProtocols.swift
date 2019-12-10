//
//  CVEducationProtocols.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

protocol CVEducationViewProtocol: class {
    var presenter: CVEducationPresenterProtocol? { get set }
    
}

protocol CVEducationRouterProtocol: class {
    static func createCVEducation(title: String) -> UIViewController
}

protocol CVEducationPresenterProtocol: class {
    var view: CVEducationViewProtocol? { get set }
    var interactor: CVEducationInteractorInputProtocol? { get set }
    var router: CVEducationRouterProtocol? { get set }
    
    func getSizeForItem(indexPath: IndexPath) -> CGFloat
    func getCellIdentifier(indexPath: IndexPath) -> String
    func getValuesForEducation(indexPath: IndexPath) -> Education
    func getValuesForTechnicalSkills(indexPath: IndexPath) -> TechnicalSkillsResults
    func getItemsInSection(section: Int) -> Int
    func getSectionTitle(section: Int) -> String
    func getSections() -> Int
}

protocol CVEducationInteractorInputProtocol: class {
    var presenter: CVEducationInteractorOutputProtocol? { get set }
    var internalDataManager: CVEducationDataManagerInputProtocol? { get set }
    
    func getEducationValues(indexPath: IndexPath) -> Education
    func getTechnicalSkillsValues(indexPath: IndexPath) -> TechnicalSkillsResults
    func getSections() -> Int
    func getItemsInSection(section: Int) -> Int
}

protocol CVEducationInteractorOutputProtocol: class {
    
}

protocol CVEducationDataManagerInputProtocol: class {
    var interactor: CVEducationDataManagerOutputProtocol? { get set }
    
    func getCVPersonalProfileData()
    func getTechnicalSkills() -> [TechnicalSkillsResults]?
    func getEducation() -> [EducationResults]?
}

protocol CVEducationDataManagerOutputProtocol: class {
    
}
