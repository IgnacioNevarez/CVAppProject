//
//  CVRemoteDataAPI.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVRemoteDataAPI: Codable {
    
    var candidateName: String
    var about: String
    var photo: String?
    var contactInfo: [ContactInfoResults]
    var workExperience: [WorkExperienceResults]
    var technicalSkills: [TechnicalSkillsResults]
    var education: [EducationResults]
    
    enum codingKeys: String, CodingKey {
        case candidateName, about, photo, contactInfo, workExperience, technicalSkills, education
    }
    
    required init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.candidateName = try container.decode(String.self, forKey: .candidateName)
        self.about = try container.decode(String.self, forKey: .about)
        self.photo = try container.decode(String.self, forKey: .photo)
        self.contactInfo = try container.decode([ContactInfoResults].self, forKey: .contactInfo)
        self.workExperience = try container.decode([WorkExperienceResults].self, forKey: .workExperience)
        self.technicalSkills = try container.decode([TechnicalSkillsResults].self, forKey: .technicalSkills)
        self.education = try container.decode([EducationResults].self, forKey: .education)
    }
    
}

class ContactInfoResults: Codable {
    
    var type: String
    var value: String
    
    enum codingKeys: String, CodingKey {
        case type, value
    }
    
    required init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.value = try container.decode(String.self, forKey: .value)
    }
    
    init (type: String, value: String) {
        self.type = type
        self.value = value
    }
}

class WorkExperienceResults: Codable {
    
    var companyName: String
    var timeFrame: String
    var jobPosition: String
    var jobDescription: String
    var companyLogo: String?

    enum codingKeys: String, CodingKey {
        case companyName, timeFrame, jobPosition, jobDescription, companyLogo
    }
    
    required init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.companyName = try container.decode(String.self, forKey: .companyName)
        self.timeFrame = try container.decode(String.self, forKey: .timeFrame)
        self.jobPosition = try container.decode(String.self, forKey: .jobPosition)
        self.jobDescription = try container.decode(String.self, forKey: .jobDescription)
        self.companyLogo = try container.decode(String.self, forKey: .companyLogo)
    }
    
    init(companyName: String, timeFrame: String, jobPosition: String, jobDescription: String, companyLogo: String?) {
        self.companyName = companyName
        self.timeFrame = timeFrame
        self.jobPosition = jobPosition
        self.jobDescription = jobDescription
        self.companyLogo = companyLogo
    }
}

class TechnicalSkillsResults: Codable {
    
    var skill: String
    var value: String
    
    enum codingKeys: String, CodingKey {
        case skill, value
    }
    
    required init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.skill = try container.decode(String.self, forKey: .skill)
        self.value = try container.decode(String.self, forKey: .value)
    }
    
    init(skill: String, value: String) {
        self.skill = skill
        self.value = value
    }
}

class EducationResults: Codable {
    var degreeName: String
    var completionDate: String
    var universityName: String
    var universityLogo: String?
    
    enum codingKeys: String, CodingKey {
        case degreeName, completionDate, universityName, universityLogo
    }
    
    required init(decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.degreeName = try container.decode(String.self, forKey: .degreeName)
        self.completionDate = try container.decode(String.self, forKey: .completionDate)
        self.universityName = try container.decode(String.self, forKey: .universityName)
        self.universityLogo = try container.decode(String.self, forKey: .universityLogo)
    }
    
    init(degreeName: String, completionDate: String, universityName: String, universityLogo: String?) {
        self.degreeName = degreeName
        self.completionDate = completionDate
        self.universityName = universityName
        self.universityLogo = universityLogo
    }
}

struct Education {
    let educationInfo: EducationResults
    let universityLogoURL: URL?
}

struct WorkExperience {
    let workExperienceInfo: WorkExperienceResults
    let companyLogoURL: URL?
}
