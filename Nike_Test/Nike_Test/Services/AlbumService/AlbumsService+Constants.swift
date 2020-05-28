//
//  AlbumsService+Constants.swift
//  Nike_Test
//
//  Created by Robin G on 5/26/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

extension AlbumsService {
    enum Constants {
        static let baseURL: String = "https://rss.itunes.apple.com/api/v1/us/apple-music/"
        // TODO: - Add filtering with below properties
        static let feedType: String = "top-albums"
        static let genre: String = "all"
        static let resultsLimit = "100"
        static let allowExplicit = "explicit"
        static let format: String = "json"
        static let url: URL = {
            guard let url = URL(string: "\(baseURL)\(feedType)/\(genre)/\(resultsLimit)/\(allowExplicit).\(format)") else {
                fatalError()
            }
            return url
        }()
    }
    
}
