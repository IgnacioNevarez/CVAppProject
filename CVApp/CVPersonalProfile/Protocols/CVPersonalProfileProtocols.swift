//
//  CVPersonalProfileProtocols.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation
import UIKit

protocol CVPersonalProfileViewProtocol: class {
    var presenter: CVPersonalProfilePresenterProtocol? { get set }
    
}

protocol CVPersonalProfileRouterProtocol: class {
    static func createCVPersonalProfile(title: String) -> UIViewController
}

protocol CVPersonalProfilePresenterProtocol: class {
    var view: CVPersonalProfileViewProtocol? { get set }
    var interactor: CVPersonalProfileInteractorInputProtocol? { get set }
    var router: CVPersonalProfileRouterProtocol? { get set }
    
    func getCandidatePhoto() -> URL?
    func getAboutValue(indexPath: IndexPath) -> String
    func getValuesForContactItem(indexPath: IndexPath) -> ContactInfoResults
    func getItemsInSection(section: Int) -> Int
    func getCellIdentifier(indexPath: IndexPath) -> String
    func getSizeForItem(indexPath: IndexPath) -> CGFloat
    func getSectionTitle(section: Int) -> String
    func getSections() -> Int 
}

protocol CVPersonalProfileInteractorInputProtocol: class {
    var presenter: CVPersonalProfileInteractorOutputProtocol? { get set }
    var internalDataManager: CVPersonalProfileDataManagerInputProtocol? { get set }

    func getAboutValue(indexPath: IndexPath) -> String
    func getValuesForContactItem(indexPath: IndexPath) -> ContactInfoResults
    func getItemsInSection(section: Int) -> Int
    func getCandidatePhoto() -> URL?
    func getSections() -> Int 
}

protocol CVPersonalProfileInteractorOutputProtocol: class {
    
}

protocol CVPersonalProfileDataManagerInputProtocol: class {
    var interactor: CVPersonalProfileDataManagerOutputProtocol? { get set }
    
    func getCVPersonalProfileData()
    func getPersonalPhoto() -> String?
    func getPersonalAbout() -> String?
    func getPersonalContactInfo() -> [ContactInfoResults]?
}

protocol CVPersonalProfileDataManagerOutputProtocol: class {
    
}
