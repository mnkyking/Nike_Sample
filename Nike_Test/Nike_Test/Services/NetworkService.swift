//
//  NetworkService.swift
//  Nike_Test
//
//  Created by Robin G on 5/20/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

struct NetworkService {
    
    func requestAlbumList(albumList: @escaping ([Album])->()) {
        let session = URLSession.shared
        //let url = URL(string: "https://learnappmaking.com/ex/users.json")!
        let feedType: String = "top-albums"
        let genre: String = "all"
        let resultsLimit: String = "100"
        let allowExplicit: String = true ? "explicit" : "non-explicit"
        let format: String = "json"
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/\(feedType)/\(genre)/\(resultsLimit)/\(allowExplicit).\(format)")!
        
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
                let json = try decoder.decode(RSSFeed.self, from: data)
                if let albums = json.feed?.results {
                    print(albums)
                    albumList(albums)
                }
                
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}
