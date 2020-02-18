//
//  FirstViewController.swift
//  Task6-2
//
//  Created by Aleksey Bardin on 18.02.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
  
  private let identifier = "toThirdViewController"

  @IBOutlet weak var textField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textField.text = nil
  }

  @IBAction func toThirdViewControllerButton(_ sender: Any) {
    performSegue(withIdentifier: identifier, sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let destination = segue.destination as? ThirdViewController {
               if let textToPass = textField.text {
                  destination.text = textToPass
               }
           }
       }
}

