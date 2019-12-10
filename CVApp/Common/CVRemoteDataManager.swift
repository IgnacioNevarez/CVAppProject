//
//  CVRemoteDataManager.swift
//  CVApp
//
//  Created by Ignacio Esau Nevarez on 06/12/19.
//  Copyright © 2019 Ignacio Esau Nevarez. All rights reserved.
//

import Foundation

class CVRemoteDataManager {
    
    static let shared = CVRemoteDataManager()
    
    var urlComponents = URLComponents()
    var dataTask: URLSessionDataTask?
    
    private init() {}
    
    func getRemoteData() {
        
        urlComponents.scheme = CVConstants.URL.scheme
        urlComponents.host = CVConstants.URL.host
        urlComponents.path = CVConstants.URL.path
        
        guard let componentsURL = urlComponents.url else { return }
        let urlRequest = URLRequest(url: componentsURL)
        print(urlRequest)
        
        dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else { fatalError() }
            
            do {
                let cvResults = try JSONDecoder().decode(CVRemoteDataAPI.self, from: data)
                CVInternalDataManager.shared.storePersonCV(cvResults: cvResults)
            } catch {
                print(error)
            }
        }
        guard let dataTask = dataTask else { return }
        dataTask.resume()
    }
    
}
