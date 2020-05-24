//
//  NetworkService.swift
//  Nike_Test
//
//  Created by Robin G on 5/20/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

struct NetworkService {
    
    var baseURL: String { return "https://rss.itunes.apple.com/api/v1/us/apple-music/" }
    // TODO: - Add filtering with below properties
    var feedType: String { return "top-albums" }
    var genre: String { return "all" }
    var resultsLimit: String { return "100" }
    var allowExplicit: String { return "explicit" }
    var format: String { return "json" }
    
    // TODO: - Add error handling when cannot retrieve data or properly decode data
    func requestAlbumList(albumList: @escaping ([Album])->()) {
        let session = URLSession.shared
        let url = URL(string: "\(baseURL)\(feedType)/\(genre)/\(resultsLimit)/\(allowExplicit).\(format)")!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil {
                print("Client error!")
                return
            }
            
            guard let data = data else { return }

            do {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd"
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(formatter)
                let feed = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                print(feed ?? "feed not found")
                let json = try decoder.decode(RSSFeed.self, from: data)
                if let albums = json.feed?.results { albumList(albums) }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}
