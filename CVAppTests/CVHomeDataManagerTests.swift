//
//  CVAppEntityTests.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import XCTest
@testable import CVApp

class CVAppEntityTests: XCTestCase {
    

    func testCandidateNameResult() {
        
        let cvPersonalProfileResult = CVInternalDataManager.shared.retrievePersonCV()
        XCTAssertEqual(cvPersonalProfileResult?.candidateName, "Ignacio Nevarez" )
    }

}
