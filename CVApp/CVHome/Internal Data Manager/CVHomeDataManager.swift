//
//  CVHomeDataManager.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 07/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVHomeDataManager: CVHomeDataManagerInputProtocol {
    
    weak var interactor: CVHomeDataManagerOutputProtocol?
    var cvHomeData: CVRemoteDataAPI?
    
    func getCVHomeData() -> String? {
        guard let cvPersonalProfileResult = CVInternalDataManager.shared.retrievePersonCV() else {
            return nil
        }
        
        cvHomeData = cvPersonalProfileResult
        return cvHomeData?.candidateName
    }
}
