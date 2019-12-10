//
//  CVEducationInteractor.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVEducationInteractor: CVEducationInteractorInputProtocol {
    
    weak var presenter: CVEducationInteractorOutputProtocol?
    var internalDataManager: CVEducationDataManagerInputProtocol?
    
    init(dataManager: CVEducationDataManagerInputProtocol) {
        internalDataManager = dataManager
        internalDataManager?.getCVPersonalProfileData()
        fillResults()
    }
    
    private var results: [[Any]] = []
    
    private func fillResults() {
        guard let education = internalDataManager?.getEducation(), let technicalSkills =  internalDataManager?.getTechnicalSkills() else {
            return
        }
        
        results.append(transformEducationResults(education: education))
        results.append(technicalSkills)
    }
    
    private func transformEducationResults(education: [EducationResults]) -> [Education] {
        var educationStruct = [Education]()
        for item in education {
            educationStruct.append(Education(educationInfo: item, universityLogoURL: getURL(string: item.universityLogo)))
        }
        return educationStruct
    }
    
    private func getURL(string: String?) -> URL? {
        guard let string = string else { return nil }
        return URL(string: string)
    }
    
    func getEducationValues(indexPath: IndexPath) -> Education {
        guard let educationValue = results[indexPath.section][indexPath.row] as? Education else {
            let educationResult = EducationResults(degreeName: "Unkown", completionDate: "Unkown", universityName: "Unkown", universityLogo: nil)
            return Education(educationInfo: educationResult, universityLogoURL: nil)
        }
        return educationValue
    }
    
    func getTechnicalSkillsValues(indexPath: IndexPath) -> TechnicalSkillsResults {
        guard let technicalSkillsValue = results[indexPath.section][indexPath.row] as? TechnicalSkillsResults else { return TechnicalSkillsResults(skill: "Unkown", value: "Unkown") }
        return technicalSkillsValue
    }
    
    func getSections() -> Int {
        return results.count
    }
    
    func getItemsInSection(section: Int) -> Int {
        return results[section].count
    }
}

extension CVEducationInteractor: CVEducationDataManagerOutputProtocol {
    
}
