//
//  CVPersonalProfileRouter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

class CVPersonalProfileRouter: CVPersonalProfileRouterProtocol {
   
    static func createCVPersonalProfile(title: String) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "cvPersonalProfileView")
        
        if let view = viewController as? CVPersonalProfileView {
            
            view.navigationItem.title = title.uppercased()
            
            let dataManager: CVPersonalProfileDataManagerInputProtocol = CVPersonalProfileDataManager()
            let interactor: CVPersonalProfileInteractorInputProtocol & CVPersonalProfileDataManagerOutputProtocol = CVPersonalProfileInteractor(dataManager: dataManager)
            let presenter: CVPersonalProfilePresenterProtocol & CVPersonalProfileInteractorOutputProtocol = CVPersonalProfilePresenter()
            let router: CVPersonalProfileRouterProtocol = CVPersonalProfileRouter()
            
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
        return UIStoryboard(name: "CVPersonalProfileView", bundle: Bundle.main)
    }
    
    
}
