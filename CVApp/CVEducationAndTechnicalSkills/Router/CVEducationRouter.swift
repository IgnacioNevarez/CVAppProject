//
//  CVEducationRouter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

class CVEducationRouter: CVEducationRouterProtocol {
    
    static func createCVEducation(title: String) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "cvEducationView")
        
        if let view = viewController as? CVEducationView {
            
            view.navigationItem.title = title.uppercased()
            
            let dataManager: CVEducationDataManagerInputProtocol = CVEducationDataManager()
            let interactor: CVEducationInteractorInputProtocol & CVEducationDataManagerOutputProtocol = CVEducationInteractor(dataManager: dataManager)
            let presenter: CVEducationPresenterProtocol & CVEducationInteractorOutputProtocol = CVEducationPresenter()
            let router: CVEducationRouterProtocol = CVEducationRouter()
            
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
        return UIStoryboard(name: "CVEducationView", bundle: Bundle.main)
    }
    
    
}

