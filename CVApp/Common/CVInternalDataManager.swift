//
//  CVInternalDataManager.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 07/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVInternalDataManager {
    
    static let shared = CVInternalDataManager()
    
    private init() {}
    
    private static let cvAppSupportDirectory: URL = {
        let urlSupportDirectory = FileManager().urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
        if !FileManager().fileExists(atPath: urlSupportDirectory.path) {
            do{
                try FileManager().createDirectory(at: urlSupportDirectory, withIntermediateDirectories: false)
            } catch let error as NSError {
                print("\(error.localizedDescription)")
            }
            
        }
        return urlSupportDirectory
    }()
    
    private let cvPersonData = cvAppSupportDirectory.appendingPathComponent("Person")
    
    func storePersonCV(cvResults: CVRemoteDataAPI) {
        
        let encoder = PropertyListEncoder()
        do {
            let encodedCVPersonData = try encoder.encode(cvResults)
            let success = NSKeyedArchiver.archiveRootObject(encodedCVPersonData, toFile: cvPersonData.path)
            print(success)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func retrievePersonCV() -> CVRemoteDataAPI? {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: cvPersonData.path) as? Data else { return nil }
        
        let decoder = PropertyListDecoder()
        
        do {
            let decodedPersonData = try decoder.decode(CVRemoteDataAPI.self, from: data)
            return decodedPersonData
        } catch {
            return nil
        }
    }
    
    
}


