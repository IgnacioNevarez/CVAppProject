//
//  CVEducationAndTechnicalSkillsDataManager.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 07/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVEducationDataManager: CVEducationDataManagerInputProtocol {

    var interactor: CVEducationDataManagerOutputProtocol?
    private var cvEducationData: CVRemoteDataAPI?
    
    func getCVPersonalProfileData() {
        
        guard let cvEducationResult = CVInternalDataManager.shared.retrievePersonCV() else {
            return
        }
        
        cvEducationData = cvEducationResult
    }
    
    func getTechnicalSkills() -> [TechnicalSkillsResults]? {
        return cvEducationData?.technicalSkills
    }
    
    func getEducation() -> [EducationResults]? {
        return cvEducationData?.education
    }
    
    
}

