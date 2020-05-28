//
//  LocalDataCache.swift
//  Nike_Test
//
//  Created by Robin G on 5/26/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

class LocalDataCache {
    
    private let cache = NSCache<NSURL, NSData>()
    
    init() {}
    
}

extension LocalDataCache {
    func set(data: Data, for url: URL) {
        guard let key = NSURL(string: url.absoluteString) else {
            return
        }
        let object = NSData(data: data)
        cache.setObject(object, forKey: key)
    }
    
    func get(from url: URL) -> Data? {
        guard let key = NSURL(string: url.absoluteString) else {
            return nil
        }
        guard let object = cache.object(forKey: key) else {
            return nil
        }
        return Data(referencing: object)
    }
    
}
