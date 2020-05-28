//
//  LocalDataServiceProtocol.swift
//  Nike_Test
//
//  Created by Robin G on 5/27/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation

typealias DataHandler = (Data?)->Void

protocol LocalDataServiceProtocol {
    func get(from url: URL, completion: @escaping DataHandler)
}
