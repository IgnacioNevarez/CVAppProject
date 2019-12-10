//
//  CVPersonalProfileDataManagerTests.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import XCTest
@testable import CVApp

class CVPersonalProfileDataManagerTests: XCTestCase {

    func testPhotoAboutAndContactInfoResults() {
        
        let cvPersonalProfileResult = CVInternalDataManager.shared.retrievePersonCV()
        XCTAssertEqual(cvPersonalProfileResult?.photo, "https://avatars1.githubusercontent.com/u/55265068?s=400&u=6ea2a8b12071264254e76c562f220830fff9ff09&v=4")
        XCTAssertEqual(cvPersonalProfileResult?.about, "iOS developer with two years and eight months of experience in Swift. Involved in design, development and testing of native mobile applications")
        XCTAssertEqual(cvPersonalProfileResult?.contactInfo[0].type, "phone")
        XCTAssertEqual(cvPersonalProfileResult?.contactInfo[0].value, "5578545924")
        XCTAssertEqual(cvPersonalProfileResult?.contactInfo[1].type, "github")
        XCTAssertEqual(cvPersonalProfileResult?.contactInfo[1].value, "https://github.com/IgnacioNevarez")
        XCTAssertEqual(cvPersonalProfileResult?.contactInfo[2].type, "mail")
        XCTAssertEqual(cvPersonalProfileResult?.contactInfo[2].value, "inevarezz1100@alumno.ipn.mx")
        
    }



}
