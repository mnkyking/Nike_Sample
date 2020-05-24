//
//  AlbumListLabel.swift
//  Nike_Test
//
//  Created by Robin G on 5/23/20.
//  Copyright © 2020 Robin G. All rights reserved.
//

import UIKit

class AlbumListLabel: UILabel {
    
    init(fontSize: CGFloat = 14.0, color: UIColor = .black) {
        super.init(frame: CGRect.zero)
        self.font = UIFont(name: "Georgia", size: fontSize)
        self.textColor = color
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
