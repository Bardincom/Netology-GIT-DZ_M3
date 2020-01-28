//
//  TableViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
  
  @IBOutlet weak var photoTableView: UITableView!
  
//  MARK: Properties
  
  let photos = PhotoProvider().photos()
  let identifier = "Cell"
  let heightRow = CGFloat(60)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    photoTableView.delegate = self
    photoTableView.dataSource = self
  }
  
}

// MARK: Delegate

extension TableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    photos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let photoCell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    
    photoCell.imageView?.image = photos[indexPath.row].image
    photoCell.textLabel?.text = photos[indexPath.row].name
    photoCell.accessoryType = .detailButton

    return photoCell
  }
  
}

// MARK: Data Source

extension TableViewController:  UITableViewDataSource {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { heightRow }
  
  func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    print("Accessory selected")
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Row selected")
    photoTableView.deselectRow(at: indexPath, animated: false)
  }

}

