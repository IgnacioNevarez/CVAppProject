//
//  CVHomePresenter.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import CoreGraphics

class CVHomePresenter: CVHomePresenterProtocol {
    var interactor: CVHomeInteractorInputProtocol?
    weak var view: CVHomeViewProtocol?
    var router: CVHomeRouterProtocol?

    var isLoadingData: Bool = false
    private var cvHomeVC: CVHomeView?
    
    func getValuesForItem(indexPath: IndexPath) -> HomeSections? {
        guard let interactor = interactor else { return nil }
        return interactor.getValuesForItem(indexPath: indexPath)
    }
    
    func getItemsInSection() -> Int {
        return interactor?.getItemsInSection() ?? 0
    }
    
    func getSizeForItem(width: CGFloat) -> CGSize {
        return CGSize(width: width - (10 * 2), height: 120)
    }
    
    func didSelectItemAt(indexPath: IndexPath, originController: CVHomeView) {
        self.cvHomeVC = originController
        interactor?.didSelectItemAt(indexPath: indexPath)
    }
    
    func getCandidateName() -> String? {
        return interactor?.getCandidateName()
    }
    
}

extension CVHomePresenter: CVHomeInteractorOutputProtocol {
    
    func askToPushProfileController(title: String) {
        guard let originVC = cvHomeVC else { return }
        router?.pushCVPersonalProfileView(title: title, cvHomeView: originVC)
    }
    
    func askToPushWorkController(title: String) {
        guard let originVC = cvHomeVC else { return }
        router?.pushCVWorkExperienceView(title: title, cvHomeView: originVC)
    }
    
    func askToPushKnowledgeController(title: String) {
        guard let originVC = cvHomeVC else { return }
        router?.pushCVEducationAndTechnicalSkillsView(title: title, cvHomeView: originVC)
    }
}
