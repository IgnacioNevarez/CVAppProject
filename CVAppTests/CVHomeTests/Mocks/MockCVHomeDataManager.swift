//
//  MockCVHomeDataManager.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

@testable import CVApp

class MockCVHomeDataManager: CVHomeDataManagerInputProtocol {
    weak var interactor: CVHomeDataManagerOutputProtocol?
    
    func getCVHomeData() -> String? {
        return "Unkown"
    }
}
