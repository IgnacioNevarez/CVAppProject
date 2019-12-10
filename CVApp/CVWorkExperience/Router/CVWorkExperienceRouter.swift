//
//  CVWorkExperienceRouter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

class CVWorkExperienceRouter: CVWorkExperienceRouterProtocol {
    
    static func createCVWorkExperience(title: String) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "cvWorkExperienceView")
        
        if let view = viewController as? CVWorkExperienceView {
            
            view.navigationItem.title = title.uppercased()
            
            let dataManager: CVWorkExperienceDataManagerInputProtocol = CVWorkExperienceDataManager()
            let interactor: CVWorkExperienceInteractorInputProtocol & CVWorkExperienceDataManagerOutputProtocol = CVWorkExperienceInteractor(dataManager: dataManager)
            let presenter: CVWorkExperiencePresenterProtocol & CVWorkExperienceInteractorOutputProtocol = CVWorkExperiencePresenter()
            let router: CVWorkExperienceRouterProtocol = CVWorkExperienceRouter()
            
            dataManager.interactor = interactor
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            view.presenter = presenter
            
            return view
            
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "CVWorkExperienceView", bundle: Bundle.main)
    }
    
    
}


