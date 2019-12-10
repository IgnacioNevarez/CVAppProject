//
//  CVHomeInteractor.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVHomeInteractor: CVHomeInteractorInputProtocol {
    
    var cvHomeDataManager: CVHomeDataManagerInputProtocol?
    weak var presenter: CVHomeInteractorOutputProtocol?
    
    var homeSections = [HomeSections]()
    
    init () {
        prepareHomeSections()
    }
    
    private func prepareHomeSections()  {
        let section1 = HomeSections(image: CVConstants.sections.profile.image, title: CVConstants.sections.profile.title)
        let section2 = HomeSections(image: CVConstants.sections.knowledge.image, title: CVConstants.sections.knowledge.title) 
        let section3 = HomeSections(image: CVConstants.sections.work.image, title: CVConstants.sections.work.title)
        
        homeSections.append(section1)
        homeSections.append(section2)
        homeSections.append(section3)
    }
    
    func getValuesForItem(indexPath: IndexPath) -> HomeSections {
        return homeSections[indexPath.row]
    }
    
    func getItemsInSection() -> Int {
        return homeSections.count
    }
    
    func getCandidateName() -> String? {
        let name = cvHomeDataManager?.getCVHomeData()
        return name
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        
        guard let section = CVConstants.sections(rawValue: indexPath.row) else { return }
        let title = section.title
        
        switch section {
        case .profile:
            presenter?.askToPushProfileController(title: title)
        case .work:
            presenter?.askToPushWorkController(title: title)
        case .knowledge:
            presenter?.askToPushKnowledgeController(title: title)
        }
    }
}

extension CVHomeInteractor: CVHomeDataManagerOutputProtocol {
    
}
