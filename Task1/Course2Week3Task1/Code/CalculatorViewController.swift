//
//  CalculatorViewController.swift
//  Course2Week3Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//


///Приложение должно принимать от пользователя два операнда. Значения UIStepper от 1 до 10 включительно и кратны 0.5.
///Второе UISlider от 1 до 100 включительно.

import UIKit

class CalculatorViewController: UIViewController {
  
  @IBOutlet weak var resultLable: UILabel!
  @IBOutlet var textLable: [UILabel]!
  @IBOutlet weak var firstOperand: UILabel!
  @IBOutlet weak var secondOperand: UILabel!
  @IBOutlet weak var stepperOutlet: UIStepper!
  @IBOutlet weak var sliderOutlet: UISlider!
  @IBOutlet weak var buttonOutlet: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initialValueStepper()
    initialValueSlider()
    settingInterface()
  }
  
//  TO DO настройка цвета для Stepper
  func settingInterface() {
    view.backgroundColor = .backgroundColor
    resultLable.backgroundColor = .lableBackgroundColor
    resultLable.textColor = .textResultColor
    resultLable.text = "1"
    textLable.forEach{$0.textColor = .otherTextLableColor}
    sliderOutlet.tintColor = .actionElementsColor
    buttonOutlet.backgroundColor = .actionElementsColor
    buttonOutlet.setTitleColor(.otherTextLableColor, for: .normal)
    buttonOutlet.setTitle("Calculate", for: .normal)
  }
  
  func initialValueStepper() {
    stepperOutlet.minimumValue = 1
    stepperOutlet.maximumValue = 10
    stepperOutlet.stepValue = 0.5
    firstOperand.text = numberFormatterStepper(stepperOutlet.value)
  }
  
  func initialValueSlider() {
    sliderOutlet.minimumValue = 1
    sliderOutlet.maximumValue = 100
    secondOperand.text = numberFormatterSlider(sliderOutlet.value)
  }
  
  @IBAction func settingValueStepper(_ sender: UIStepper) {
    firstOperand.text = numberFormatterStepper(sender.value)
  }
  
  @IBAction func settingValueSlider(_ sender: UISlider) {
    secondOperand.text = numberFormatterSlider(sender.value)
  }
  
  @IBAction func pressCalculateButton(_ sender: UIButton) {
    let numberFormatter = NumberFormatter()
    numberFormatter.maximumFractionDigits = 4
    
    resultLable.text = numberFormatter.string(from: NSNumber(value: stepperOutlet.value * Double(sliderOutlet.value)))
  }
  
}
