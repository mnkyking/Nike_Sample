//
//  Foundation+Extensions.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

extension URLSession {
    static let basic: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        let session = URLSession(configuration: config)
        return session
    }()
}

extension Array {
    subscript(safely index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
