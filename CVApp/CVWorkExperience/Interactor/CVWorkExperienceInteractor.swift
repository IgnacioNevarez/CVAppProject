//
//  CVWorkExperienceInteractor.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVWorkExperienceInteractor: CVWorkExperienceInteractorInputProtocol {

    weak var presenter: CVWorkExperienceInteractorOutputProtocol?
    var internalDataManager: CVWorkExperienceDataManagerInputProtocol?
    
    init(dataManager: CVWorkExperienceDataManagerInputProtocol) {
        internalDataManager = dataManager
        internalDataManager?.getCVPersonalProfileData()
        fillResults()
    }
    
    private var results: [[Any]] = []
    
    private func fillResults() {
        guard let workExperience = internalDataManager?.getWorkExperience() else {
            return
        }
        
        results.append(transformWorkExperienceResults(workExperience: workExperience))
    }
    
    private func transformWorkExperienceResults(workExperience: [WorkExperienceResults]) -> [WorkExperience] {
        var workExperienceStruct = [WorkExperience]()
        for item in workExperience {
            workExperienceStruct.append(WorkExperience(workExperienceInfo: item, companyLogoURL: getURL(string: item.companyLogo)))
        }
        return workExperienceStruct
    }
    
    private func getURL(string: String?) -> URL? {
        guard let string = string else { return nil }
        return URL(string: string)
    }
    
    func getWorkExperienceValues(indexPath: IndexPath) -> WorkExperience {
        guard let workExperienceValue = results[indexPath.section][indexPath.row] as? WorkExperience else {
            let workExperienceResult = WorkExperienceResults(companyName: "Unkown", timeFrame: "Unkown", jobPosition: "Unkown", jobDescription: "Unkown", companyLogo: nil)
            return WorkExperience(workExperienceInfo: workExperienceResult, companyLogoURL: nil)
        }
        return workExperienceValue
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

extension CVWorkExperienceInteractor: CVWorkExperienceDataManagerOutputProtocol {
    
}
