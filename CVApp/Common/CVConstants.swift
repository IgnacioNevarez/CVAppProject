//
//  CVConstants.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import UIKit

struct CVConstants {
    struct URL {
        static let scheme = "https"
        static let host = "cdn.statically.io"
        static let path = "/gist/IgnacioNevarez/4259c458cadebe8e4e0ae52402dda46f/raw/5a58b04533bbffc1300f675571ed15edccfdc499/CVPersonalProfile.json"
    }
    
    struct SizeForCell {
        static let space: CGFloat = 10
        static let height: CGFloat = 120
    }
    
    struct SectionTitles {
        static let aboutTitle = "About"
        static let contactInfo = "Contact Info"
        static let educationTitle = "Education"
        static let technicalSkillsTitle = "Technical Skils"
        static let workExperienceTitle = "Work Experience"
    }
    
    enum sections: Int {
        case profile
        case knowledge
        case work
        
        var title: String {
            switch self {
            case .profile:
                return "Profile"
            case .work:
                return "Work Experience"
            case .knowledge:
                return "Education and Technical Skills"
            
            }
        }
        
        var image: String {
            switch self {
            case .profile:
                return "user"
            case .work:
                return "work"
            case .knowledge:
                return "education"
                
            }
        }
    }
}
