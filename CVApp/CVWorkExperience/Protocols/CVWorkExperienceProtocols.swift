//
//  CVWorkExperienceProtocols.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

protocol CVWorkExperienceViewProtocol: class {
    var presenter: CVWorkExperiencePresenterProtocol? { get set }
    
}

protocol CVWorkExperienceRouterProtocol: class {
    static func createCVWorkExperience(title: String) -> UIViewController
}

protocol CVWorkExperiencePresenterProtocol: class {
    var view: CVWorkExperienceViewProtocol? { get set }
    var interactor: CVWorkExperienceInteractorInputProtocol? { get set }
    var router: CVWorkExperienceRouterProtocol? { get set }
    
    func getSizeForItem(indexPath: IndexPath) -> CGFloat
    func getCellIdentifier(indexPath: IndexPath) -> String
    func getValuesForWorkExperience(indexPath: IndexPath) -> WorkExperience
    func getItemsInSection(section: Int) -> Int
    func getSectionTitle(section: Int) -> String
    func getSections() -> Int
}

protocol CVWorkExperienceInteractorInputProtocol: class {
    var presenter: CVWorkExperienceInteractorOutputProtocol? { get set }
    var internalDataManager: CVWorkExperienceDataManagerInputProtocol? { get set }
    
    func getWorkExperienceValues(indexPath: IndexPath) -> WorkExperience
    func getSections() -> Int
    func getItemsInSection(section: Int) -> Int
}

protocol CVWorkExperienceInteractorOutputProtocol: class {
    
}

protocol CVWorkExperienceDataManagerInputProtocol: class {
    var interactor: CVWorkExperienceDataManagerOutputProtocol? { get set }
    
    func getCVPersonalProfileData()
    func getWorkExperience() ->  [WorkExperienceResults]?
    
}

protocol CVWorkExperienceDataManagerOutputProtocol: class {
    
}
