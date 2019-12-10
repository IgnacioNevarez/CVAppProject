//
//  CVHomeInteractorTests.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import XCTest
@testable import CVApp

class CVHomeInteractorTests: XCTestCase {
    
    var sut: CVHomeInteractor?
    var mockPresenter = MockCVHomePresenter()
    var mockDataManager = MockCVHomeDataManager()

    override func setUp() {
        super.setUp()
        sut = CVHomeInteractor()
        sut?.presenter = mockPresenter
        sut?.cvHomeDataManager = mockDataManager
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        sut?.presenter = nil
        sut?.cvHomeDataManager = nil
    }
    
    func testGetValuesForItemZero() {
        let result = sut?.getValuesForItem(indexPath: IndexPath(item: 0, section: 0))
        let homeSection = HomeSections(image: CVConstants.sections.profile.image, title: CVConstants.sections.profile.title)
        XCTAssertEqual(result, homeSection, "GetValuesForItemZero is not working well")
    }
    
    func testGetValuesForItemOne() {
        let result = sut?.getValuesForItem(indexPath: IndexPath(item: 1, section: 0))
        let homeSection = HomeSections(image: CVConstants.sections.knowledge.image, title: CVConstants.sections.knowledge.title)
        XCTAssertEqual(result, homeSection, "GetValuesForItemOne is not working well")
    }
    
    func testGetValuesForItemTwo() {
        let result = sut?.getValuesForItem(indexPath: IndexPath(item: 2, section: 0))
        let homeSection = HomeSections(image: CVConstants.sections.work.image, title: CVConstants.sections.work.title)
        XCTAssertEqual(result, homeSection, "GetValuesForItemTwo is not working well")
    }
    
    func testGetItemsInSection(){
        let result = sut?.getItemsInSection()
        XCTAssertNotEqual(result, 0, "GetItemsInSection is not working well")
    }
    
    func testGetCandidateName() {
        let result = sut?.getCandidateName()
        XCTAssertNotNil(result, "GetCandidateName is not working well")
    }

    func testDidSelectItemAtZero() {
        sut?.didSelectItemAt(indexPath: IndexPath(item: 0, section: 0))
        XCTAssert(mockPresenter.calls.askToPushProfileController, "AskToPushProfileControllerView wasn't called")
    }
    
    func testDidSelectItemAtOne() {
        sut?.didSelectItemAt(indexPath: IndexPath(item: 1, section: 0))
        XCTAssert(mockPresenter.calls.askToPushKnowledgeController, "AskToPushKnowledgeController wasn't called")
    }
    
    func testDidSelectItemAtTwo() {
        sut?.didSelectItemAt(indexPath: IndexPath(item: 2, section: 0))
        XCTAssert(mockPresenter.calls.askToPushWorkController, "AskToPushWorkController wasn't called")
    }
}
