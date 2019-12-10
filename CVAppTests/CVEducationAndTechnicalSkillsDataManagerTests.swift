//
//  CVEducationAndTechnicalSkillsDataManagerTests.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import XCTest
@testable import CVApp

class CVEducationAndTechnicalSkillsDataManagerTests: XCTestCase {

    func testTechnicalSkillsAndEducationResults() {
        
        let cvPersonalProfileResult = CVInternalDataManager.shared.retrievePersonCV()
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[0].skill, "Programming Languages")
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[0].value, "Swift, Java and PHP")
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[1].skill, "Architecture Patterns")
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[1].value, "MVC, MVP and VIPER")
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[2].skill, "Dependency Managers")
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[2].value, "Carthage and CocoaPods")
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[3].skill, "Frameworks")
        XCTAssertEqual(cvPersonalProfileResult?.technicalSkills[3].value, "Foundation, UIKit, SiriKit, MapKit, Core Location, Core Animation and CoreML")
        XCTAssertEqual(cvPersonalProfileResult?.education[0].universityLogo,     "https://upload.wikimedia.org/wikipedia/commons/f/f8/Logo_Instituto_Polit%C3%A9cnico_Nacional.png")
        XCTAssertEqual(cvPersonalProfileResult?.education[0].degreeName, "Bachelor's in Informatics Engineering")
        XCTAssertEqual(cvPersonalProfileResult?.education[0].universityName, "National Polytechnic Institute")
        XCTAssertEqual(cvPersonalProfileResult?.education[0].completionDate, "April 2018")
        XCTAssertEqual(cvPersonalProfileResult?.education[1].universityLogo, "https://upload.wikimedia.org/wikipedia/commons/f/fa/Logounir.png")
        XCTAssertEqual(cvPersonalProfileResult?.education[1].degreeName, "Master in Software Engineering and Computer Systems")
        XCTAssertEqual(cvPersonalProfileResult?.education[1].universityName, "International University of La Rioja in Mexico")
        XCTAssertEqual(cvPersonalProfileResult?.education[1].completionDate, "In progress")
    }


}
