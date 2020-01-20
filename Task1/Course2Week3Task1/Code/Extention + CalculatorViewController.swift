//
//  Extention + CalculatorViewController.swift
//  Course2Week3Task1
//
//  Created by Aleksey Bardin on 20.01.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

extension CalculatorViewController {
  
  func settingInterface() {
    view.backgroundColor = .backgroundColor
    
    resultLable.backgroundColor = .lableBackgroundColor
    resultLable.textColor = .textResultColor
    resultLable.text = "1"
    resultLable.font = .systemFont(ofSize: 30)
    resultLable.textAlignment = .right
    
    textLable.forEach{$0.textColor = .otherTextLableColor}
    
    sliderOutlet.tintColor = .actionElementsColor
    
    stepperOutlet.layer.borderWidth = 1
    stepperOutlet.layer.cornerRadius = 5
    stepperOutlet.layer.borderColor = UIColor.actionElementsColor.cgColor
    stepperOutlet.tintColor = .actionElementsColor
    stepperOutlet.setDecrementImage(stepperOutlet.decrementImage(for: .normal), for: .normal)
    stepperOutlet.setIncrementImage(stepperOutlet.incrementImage(for: .normal), for: .normal)
    stepperOutlet.tintColor = .actionElementsColor
    
    buttonOutlet.backgroundColor = .actionElementsColor
    buttonOutlet.setTitleColor(.otherTextLableColor, for: .normal)
    buttonOutlet.setTitle("Calculate", for: .normal)
  }
  
  func initialValueStepper() {
    stepperOutlet.minimumValue = 1
    stepperOutlet.maximumValue = 10
    stepperOutlet.stepValue = 0.5
    firstOperand.text = setValueOperand(NSNumber(value: stepperOutlet.value))
  }
  
  func initialValueSlider() {
    sliderOutlet.minimumValue = 1
    sliderOutlet.maximumValue = 100
    secondOperand.text = setValueOperand(NSNumber(value: sliderOutlet.value))
  }
  
  func setValueOperand(_ value: NSNumber) -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.minimumFractionDigits = 4
    
    return numberFormatter.string(from: value)
  }
  
  func multiplication(_ firstOperand: Double, _ secondOperand: Float ) -> String? {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 4
    
    return numberFormatter.string(from: NSNumber(value: firstOperand * Double(secondOperand)))
  }

}
