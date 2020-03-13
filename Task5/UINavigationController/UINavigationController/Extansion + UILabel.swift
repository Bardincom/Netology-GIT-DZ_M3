//
//  Extansion + UILabel.swift
//  UINavigationController
//
//  Created by Aleksey Bardin on 15.02.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

extension UILabel {
  func configureLable(_ text: String) {
    self.font = .systemFont(ofSize: 17)
    self.textColor = .black
    self.text = text
  }
}
