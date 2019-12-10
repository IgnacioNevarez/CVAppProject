//
//  CVHomeRouter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

class CVHomeRouter: CVHomeRouterProtocol {
 
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "CVHomeView", bundle: Bundle.main)
    }
    
    static func createCVHomeModule() -> UIViewController {
        
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigation")
        
        if let view = navController.children.first as? CVHomeView {
            let presenter: CVHomePresenterProtocol & CVHomeInteractorOutputProtocol = CVHomePresenter()
            let interactor: CVHomeInteractorInputProtocol & CVHomeDataManagerOutputProtocol = CVHomeInteractor()
            let dataManager: CVHomeDataManagerInputProtocol  = CVHomeDataManager()
            let router: CVHomeRouterProtocol = CVHomeRouter()
            
            interactor.cvHomeDataManager = dataManager
            dataManager.interactor = interactor
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            view.presenter = presenter
            
            return navController
            
        }
        
        return UIViewController()
    }
    
    func pushCVPersonalProfileView(title: String, cvHomeView: CVHomeView) {
        let cvPersonalProfileView = CVPersonalProfileRouter.createCVPersonalProfile(title: title)
        cvHomeView.navigationController?.pushViewController(cvPersonalProfileView, animated: true)
    }
    
    func pushCVEducationAndTechnicalSkillsView(title: String, cvHomeView: CVHomeView) {
        let cvEducationView = CVEducationRouter.createCVEducation(title: title)
        cvHomeView.navigationController?.pushViewController(cvEducationView, animated: true)
    }
    
    func pushCVWorkExperienceView(title: String, cvHomeView: CVHomeView) {
        let cvWorkExperienceView = CVWorkExperienceRouter.createCVWorkExperience(title: title)
        cvHomeView.navigationController?.pushViewController(cvWorkExperienceView, animated: true)
    }
}
