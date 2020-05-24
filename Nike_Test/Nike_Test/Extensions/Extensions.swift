//
//  Extensions.swift
//  Nike_Test
//
//  Created by Robin G on 5/23/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func addSuffix(_ suffix: String) -> String {
        if self.hasSuffix(suffix) { return self }
        return "\(self)\(suffix)"
    }
}
