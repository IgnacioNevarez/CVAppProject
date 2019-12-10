//
//  MockCVHomeView.swift
//  CVAppTests
//
//  Created by Ignacio Esau Nevarez on 09/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit
@testable import CVApp

struct MockCVHomeRouterCalls {
    
    var pushCVPersonalProfileView: Bool = false
    var pushCVEducationAndTechnicalSkillsView: Bool = false
    var pushCVWorkExperienceView: Bool = false
}

class MockCVHomeRouter: CVHomeRouterProtocol {
    
    var calls = MockCVHomeRouterCalls()
    
    static func createCVHomeModule() -> UIViewController {
        return UIViewController()
    }
    
    func pushCVPersonalProfileView(title: String, cvHomeView: CVHomeView) {
        calls.pushCVPersonalProfileView = true
    }
    
    func pushCVEducationAndTechnicalSkillsView(title: String, cvHomeView: CVHomeView) {
        calls.pushCVEducationAndTechnicalSkillsView = true
    }
    
    func pushCVWorkExperienceView(title: String, cvHomeView: CVHomeView) {
        calls.pushCVWorkExperienceView = true
    }
}
