//
//  MockCVPresenter.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

@testable import CVApp

struct MockCVHomePresenterCalls {

    var askToPushProfileController: Bool = false
    var askToPushWorkController: Bool = false
    var askToPushKnowledgeController: Bool = false
}

class MockCVHomePresenter: CVHomeInteractorOutputProtocol {
    weak var view: CVHomeViewProtocol?
    var interactor: CVHomeInteractorInputProtocol?
    var router: CVHomeRouterProtocol?
 
    var calls = MockCVHomePresenterCalls()
    
    func askToPushProfileController(title: String) {
        calls.askToPushProfileController = true
    }
    
    func askToPushWorkController(title: String) {
        calls.askToPushWorkController = true
    }
    
    func askToPushKnowledgeController(title: String) {
        calls.askToPushKnowledgeController = true
    }
}
