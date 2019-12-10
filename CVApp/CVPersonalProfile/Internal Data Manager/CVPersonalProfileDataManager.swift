//
//  CVPersonalProfileDataManager.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 07/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVPersonalProfileDataManager: CVPersonalProfileDataManagerInputProtocol {
    
    weak var interactor: CVPersonalProfileDataManagerOutputProtocol?
    private var cvPersonalProfileData: CVRemoteDataAPI?
    
    func getCVPersonalProfileData() {

        guard let cvPersonalProfileResult = CVInternalDataManager.shared.retrievePersonCV() else {
            return
        }
        
        cvPersonalProfileData = cvPersonalProfileResult
    }
    
    func getPersonalPhoto() -> String? {
        return cvPersonalProfileData?.photo
    }
    
    func getPersonalAbout() -> String? {
        return cvPersonalProfileData?.about
    }
    
    func getPersonalContactInfo() -> [ContactInfoResults]? {
        return cvPersonalProfileData?.contactInfo
    }

}
