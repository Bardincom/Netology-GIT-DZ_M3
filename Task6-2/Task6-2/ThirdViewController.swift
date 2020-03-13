//
//  ThirdViewController.swift
//  Task6-2
//
//  Created by Aleksey Bardin on 18.02.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
  
  private let identifier = "unwindToSecondView"
  var text: String?
  
  @IBOutlet weak var textLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let text = text {
      textLabel.text = text
    }
  }
  
  @IBAction func unwindToSecondViewControllerButton(_ sender: Any) {
    performSegue(withIdentifier: identifier, sender: nil)
  }
}
