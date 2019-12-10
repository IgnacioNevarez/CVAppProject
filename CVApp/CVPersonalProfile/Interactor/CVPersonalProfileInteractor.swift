//
//  CVPersonalProfileInteractor.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVPersonalProfileInteractor: CVPersonalProfileInteractorInputProtocol {
    
    weak var presenter: CVPersonalProfileInteractorOutputProtocol?
    var internalDataManager: CVPersonalProfileDataManagerInputProtocol?
    
    init(dataManager: CVPersonalProfileDataManagerInputProtocol) {
        internalDataManager = dataManager
        internalDataManager?.getCVPersonalProfileData()
        fillResults()
    }
    
    private var results: [[Any]] = []
    
    private func fillResults() {
        guard let about = internalDataManager?.getPersonalAbout(), let contactInfo =  internalDataManager?.getPersonalContactInfo() else {
            return
        }
        
        results.append([about])
        results.append(contactInfo)
    }
    
    func getCandidatePhoto() -> URL? {
        guard let stringURL = internalDataManager?.getPersonalPhoto() else { return nil }
        return URL(string: stringURL)
    }
    
    func getAboutValue(indexPath: IndexPath) -> String {
        guard let about = results[indexPath.section][indexPath.row] as? String else { return "No Information available" }
        return about
    }
    
    func getValuesForContactItem(indexPath: IndexPath) -> ContactInfoResults {
        guard let contact = results[indexPath.section][indexPath.row] as? ContactInfoResults else { return ContactInfoResults(type: "Unkown", value: "Unkown") }
        return contact
    }
    
    func getSections() -> Int {
        return results.count
    }
    
    func getItemsInSection(section: Int) -> Int {
        return results[section].count
    }
}

extension CVPersonalProfileInteractor: CVPersonalProfileDataManagerOutputProtocol {
    
}
