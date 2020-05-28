//
//  NetworkService.swift
//  Nike_Test
//
//  Created by Robin G on 5/20/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

class NetworkService {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    init(_ urlSession: URLSession = URLSession.basic,
         _ decoder: JSONDecoder = JSONDecoder()) {
        self.session = urlSession
        self.decoder = decoder
    }
    
    func request<Model: Decodable>(url: URL, completion: @escaping (Model?)->Void) {
        let task = session.dataTask(with: url) { (data, response, error) in
            var decoded: Model?
            defer { completion(decoded) }
            if error != nil {
                return
            }
            guard let data = data else {
                return
            }
            do {
                decoded = try self.decoder.decode(Model.self, from: data)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
}
