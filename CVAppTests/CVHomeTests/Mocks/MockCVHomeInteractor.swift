//
//  MockCVInteractor.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit
@testable import CVApp

struct MockCVHomeInteractorCalls {
    var didSelectItemAt: Bool = false
}

class MockCVHomeInteractor: CVHomeInteractorInputProtocol {

    weak var presenter: CVHomeInteractorOutputProtocol?
    var cvHomeDataManager: CVHomeDataManagerInputProtocol?
    
    var calls = MockCVHomeInteractorCalls()
    
    func getValuesForItem(indexPath: IndexPath) -> HomeSections {
        return HomeSections(image: "Unknown", title: "Unknown")
    }
    
    func getItemsInSection() -> Int {
        return 1
    }
    
    func getCandidateName() -> String? {
        return "Unknown"
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        calls.didSelectItemAt = true
    }
}
