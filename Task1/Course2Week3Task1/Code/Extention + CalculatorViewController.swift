//
//  Extention + CalculatorViewController.swift
//  Course2Week3Task1
//
//  Created by Aleksey Bardin on 20.01.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

extension CalculatorViewController {
    func numberFormatterStepper(_ value: Double) -> String? {
      let numberFormatter = NumberFormatter()
      numberFormatter.minimumFractionDigits = 4
      return numberFormatter.string(from: NSNumber(value: value))
    }
  
  func numberFormatterSlider(_ value: Float) -> String? {
      let numberFormatter = NumberFormatter()
      numberFormatter.minimumFractionDigits = 4
     return numberFormatter.string(from: NSNumber(value: value))
    }
  
//  func numberFormatter<T>(_ value: T) -> String? where T: UISlider {
//    let numberFormatter = NumberFormatter()
//    numberFormatter.minimumFractionDigits = 4
//    
//    
//    return numberFormatter.string(from: NSNumber(value: value.value))
//  }
//  
//

}
