//
//  CVHomePresenterTests.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import XCTest
@testable import CVApp

class CVHomePresenterTests: XCTestCase {
    
    var sut: CVHomePresenter?
    var mockCVRouter = MockCVHomeRouter()
    var mockCVInteractor = MockCVHomeInteractor()
    
    override func setUp() {
        super.setUp()
        sut = CVHomePresenter()
        sut?.router = mockCVRouter
        sut?.interactor = mockCVInteractor
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        sut?.router = nil
        sut?.interactor = nil
    }

    func testGetValuesForItem() {
        let result = sut?.getValuesForItem(indexPath: IndexPath(item: 0, section: 0))
        XCTAssertNotNil(result, "GetValuesForItem is not working well")
    }
    
    func testGetItemsInSection() {
        let result = sut?.getItemsInSection()
        XCTAssertNotEqual(result, 0, "GetItemsInSection is not working well")
    }
    
    func testGetSizeForItem() {
        let result = sut?.getSizeForItem(width: 100)
        XCTAssertEqual(result, CGSize(width: 100 - (10 * 2), height: 120), "GetSizeForItem is not working well")
    }
    
    func testDidSelectItemAt() {
        sut?.didSelectItemAt(indexPath: IndexPath(item: 0, section: 0), originController: CVHomeView())
        XCTAssert(mockCVInteractor.calls.didSelectItemAt, "DidSelectItemAt wasn't called")
    }

    func testGetCandidateName() {
        let result = sut?.getCandidateName()
        XCTAssertNotNil(result, "GetCandidateName is not working well")
    }

    func testAskToPushWorkController() {
        sut?.didSelectItemAt(indexPath: IndexPath(item: 0, section: 0), originController: CVHomeView())
        sut?.askToPushWorkController(title: "Work")
        XCTAssert(mockCVRouter.calls.pushCVWorkExperienceView, "PushCVWorkExperienceView wasn't called")
    }
    
    func testAskToPushProfileController() {
        sut?.didSelectItemAt(indexPath: IndexPath(item: 0, section: 0), originController: CVHomeView())
        sut?.askToPushProfileController(title: "Profile")
        XCTAssert(mockCVRouter.calls.pushCVPersonalProfileView, "PushProfileControllerView wasn't called")
    }
    
    func testAskToPushKnowledgeController() {
        sut?.didSelectItemAt(indexPath: IndexPath(item: 0, section: 0), originController: CVHomeView())
        sut?.askToPushKnowledgeController(title: "Education")
        XCTAssert(mockCVRouter.calls.pushCVEducationAndTechnicalSkillsView, "PushKnowledgeView wasn't called")
    }
}
