//
//  NetworkService.swift
//  Nike_Test
//
//  Created by Robin G on 5/20/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

struct NetworkService {
    
    func startRequest() {
        let session = URLSession.shared
        //let url = URL(string: "https://learnappmaking.com/ex/users.json")!
        let feedType: String = "top-albums"
        let genre: String = "all"
        let resultsLimit: String = "10"
        let allowExplicit: String = true ? "explicit" : "non-explicit"
        let format: String = "json"
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/\(feedType)/\(genre)/\(resultsLimit)/\(allowExplicit).\(format)")!
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }

            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }

            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        })
        task.resume()
    }
}
