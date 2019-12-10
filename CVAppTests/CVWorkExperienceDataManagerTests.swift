//
//  CVWorkExperienceDataManagerTests.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import XCTest
@testable import CVApp

class CVWorkExperienceDataManagerTests: XCTestCase {

    func testResults() {
        
        let cvPersonalProfileResult = CVInternalDataManager.shared.retrievePersonCV()
        XCTAssertEqual(cvPersonalProfileResult?.workExperience[0].companyLogo,     "https://upload.wikimedia.org/wikipedia/en/thumb/b/b1/Tata_Consultancy_Services_Logo.svg/302px-Tata_Consultancy_Services_Logo.svg.png")
        XCTAssertEqual(cvPersonalProfileResult?.workExperience[0].companyName, "TCS Mexico")
        XCTAssertEqual(cvPersonalProfileResult?.workExperience[0].jobDescription, "I contributed to the design, development and testing of modules belonging to native mobile applications in iOS.")
        XCTAssertEqual(cvPersonalProfileResult?.workExperience[0].jobPosition, "iOS Developer")
        XCTAssertEqual(cvPersonalProfileResult?.workExperience[0].timeFrame, "05/2017-12/2019")
    }


}
