//
//  LocalDataService.swift
//  Nike_Test
//
//  Created by Robin G on 5/26/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

class LocalDataService: LocalDataServiceProtocol {
    
    private let session: URLSession
    private let cache = LocalDataCache()
    
    init(_ urlSession: URLSession = URLSession.basic) {
        self.session = urlSession
    }
    
}

extension LocalDataService {
    
    func get(from url: URL, completion: @escaping DataHandler) {
        if let data = cache.get(from: url) {
            completion(data)
            return
        }
        completion(nil)
        let task = session.dataTask(with: url) { (data, _, error) in
            if error != nil {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            self.cache.set(data: data, for: url)
            completion(data)
        }
        task.resume()
    }
    
}
