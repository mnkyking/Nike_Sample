//
//  Extensions.swift
//  Nike_Test
//
//  Created by Robin G on 5/23/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

extension UIImageView {
    func set(data: Data?, tag: Int? = nil) {
        DispatchQueue.main.async {
            if let tag = tag, tag != self.tag { return }
            guard let data = data else {
                self.image = nil
                return
            }
            self.image = UIImage(data: data)
        }
    }
}
