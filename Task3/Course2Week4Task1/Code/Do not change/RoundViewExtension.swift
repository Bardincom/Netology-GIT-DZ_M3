//
//  RoundViewExtension.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeRounded(borderColour: UIColor, borderWidth: CGFloat) {
        layer.cornerRadius = (frame.size.width < frame.size.height) ? frame.size.width / 2.0 : frame.size.height / 2.0
        layer.borderColor = borderColour.cgColor
        layer.borderWidth = borderWidth
    }
}
