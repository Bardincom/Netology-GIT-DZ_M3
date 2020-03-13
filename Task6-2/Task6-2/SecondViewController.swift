//
//  SecondViewController.swift
//  Task6-2
//
//  Created by Aleksey Bardin on 18.02.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBAction func unwindToSecondViewController(segue:UIStoryboardSegue) {}
  
  @IBAction func toXIBViewButton(_ sender: Any) {
    let fourthViewController = FourthViewController()
    present(fourthViewController, animated: true, completion: nil)
  }
  
  @IBAction func toChildButton(_ sender: Any) {
    addChild(FifthViewController())
  }
}
