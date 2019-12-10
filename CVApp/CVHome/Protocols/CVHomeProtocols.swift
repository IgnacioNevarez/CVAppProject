//
//  CVHomeProtocols.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

protocol CVHomeViewProtocol: class {
    var presenter: CVHomePresenterProtocol? { get set }
}

protocol CVHomeRouterProtocol: class {
    static func createCVHomeModule() -> UIViewController
    func pushCVPersonalProfileView(title: String, cvHomeView: CVHomeView)
    func pushCVEducationAndTechnicalSkillsView(title: String, cvHomeView: CVHomeView)
    func pushCVWorkExperienceView(title: String, cvHomeView: CVHomeView)
}

protocol CVHomePresenterProtocol: class {
    var view: CVHomeViewProtocol? { get set }
    var interactor: CVHomeInteractorInputProtocol? { get set }
    var router: CVHomeRouterProtocol? { get set }
    
    func getValuesForItem(indexPath: IndexPath) -> HomeSections?
    func getItemsInSection() -> Int
    func getSizeForItem(width: CGFloat) -> CGSize
    func getCandidateName() -> String?
    func didSelectItemAt(indexPath: IndexPath, originController: CVHomeView)
}


protocol CVHomeInteractorInputProtocol: class {
    var presenter: CVHomeInteractorOutputProtocol? { get set }
    var cvHomeDataManager: CVHomeDataManagerInputProtocol? { get set }
    
    func getValuesForItem(indexPath: IndexPath) -> HomeSections
    func getItemsInSection() -> Int
    func getCandidateName() -> String?
    func didSelectItemAt(indexPath: IndexPath)
}

protocol CVHomeInteractorOutputProtocol: class {
    func askToPushProfileController(title: String)
    func askToPushWorkController(title: String)
    func askToPushKnowledgeController(title: String)
}

protocol CVHomeDataManagerInputProtocol: class {
    var interactor: CVHomeDataManagerOutputProtocol? { get set }
    func getCVHomeData() -> String?
    
}

protocol CVHomeDataManagerOutputProtocol: class {
    
}
