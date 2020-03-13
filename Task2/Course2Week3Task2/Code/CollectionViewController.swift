//
//  CollectionViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
  
  @IBOutlet weak var photoCollectionView: UICollectionView!
  
  //  MARK: Properties
  
  let photos = PhotoProvider().photos()
  let reuseIdentifier = "photoCell"
  let cellIdent = CGFloat(8)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let layout = photoCollectionView?.collectionViewLayout as? CustomFlowLayout {
      layout.delegate = self
    }
    
    ///    регистрирую ячейку
    self.photoCollectionView.register(UINib(nibName: String(describing: PhotoCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: reuseIdentifier)
    
    photoCollectionView.contentInset = .init(top: -cellIdent,
                                             left: cellIdent,
                                             bottom: 0,
                                             right: cellIdent)

    photoCollectionView.dataSource = self
  }
}

//MARK: Data Sourse
extension CollectionViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell

    cell.photoImageView.image = photos[indexPath.item].image
    cell.photoNameLabel.text = photos[indexPath.item].name
    return cell
  }
}

//MARK: Layout Delegate
extension CollectionViewController: CustomLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
    return photos[indexPath.item].image.size.height
  }
}




