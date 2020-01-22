//
//  TableViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
  
  let photos = PhotoProvider()
  
  @IBOutlet weak var photoTableView: UITableView!
  
  override func viewDidLoad() {
    photoTableView.delegate = self
    photoTableView.dataSource = self
  }
  
}

extension TableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    photos.photos().count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let photoCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    photoCell.imageView?.image = photos.photos()[indexPath.row].image
    photoCell.textLabel?.text = photos.photos()[indexPath.row].name
    photoCell.accessoryType = .detailButton

    return photoCell
  }
  
}

extension TableViewController:  UITableViewDataSource {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 60 }
  
  func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
    print("Accessory selected")
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Row selected")
    photoTableView.deselectRow(at: indexPath, animated: false)
  }
  
}

