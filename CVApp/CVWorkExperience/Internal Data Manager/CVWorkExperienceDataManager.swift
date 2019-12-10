//
//  CVWorkExperienceDataManager.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 07/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVWorkExperienceDataManager: CVWorkExperienceDataManagerInputProtocol {
  
    var interactor: CVWorkExperienceDataManagerOutputProtocol?
    
    private var cvWorkExperienceData: CVRemoteDataAPI?
    
    func getCVPersonalProfileData() {
        
        guard let cvWorkExperienceResult = CVInternalDataManager.shared.retrievePersonCV() else {
            return
        }
        
        cvWorkExperienceData = cvWorkExperienceResult
    }
    
    func getWorkExperience() -> [WorkExperienceResults]? {
        
        return cvWorkExperienceData?.workExperience
    }
    
    
}
