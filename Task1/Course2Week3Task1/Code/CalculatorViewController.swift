//
//  CalculatorViewController.swift
//  Course2Week3Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

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
  
  @IBAction func settingValueStepper(_ sender: UIStepper) {
    firstOperand.text = setValueOperand(NSNumber(value: sender.value))
  }
  
  @IBAction func settingValueSlider(_ sender: UISlider) {
    secondOperand.text = setValueOperand(NSNumber(value: sender.value))
  }
  
  @IBAction func pressCalculateButton(_ sender: UIButton) {
    resultLable.text = multiplication(stepperOutlet.value, sliderOutlet.value)
  }
  
}

