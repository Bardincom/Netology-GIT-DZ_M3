//
//  RoundButton.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeRounded(borderColour: .darkText, borderWidth: 1.0)
    }
}
