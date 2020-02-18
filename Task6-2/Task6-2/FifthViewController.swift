//
//  FifthViewController.swift
//  Task6-2
//
//  Created by Aleksey Bardin on 18.02.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit

class FifthViewController: UIViewController {
  @IBAction func removeFromParentViewButton(_ sender: Any) {
    removeFromParent()
    dismiss(animated: true, completion: nil)
  }
}
