//
//  CollectionViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//


//PhotoCollectionViewCell - это ячейка для отображения фотографий в UICollectionView. Мы немного упростили вам задачу. Используйте эту ячейку для выполнения второго задания.
//CollectionViewController - в этом контроллере вам нужно создать UICollectionView.
//CustomFlowLayout - это сабкласс UICollectionViewLayout, который нужно использовать для реализации лейаута.
/*
 2 часть. CollectionViewController
 
 Приложение должно запрашивать фотографии у PhotoProvider. Затем эти фотографии с их названиями должны выводиться в UICollectionView в ячейках PhotoCollectionViewCell. При этом должен использоваться CustomFlowLayout, располагающий фотографии по следующему алгоритму:
 
 Все фотографии выводятся в 2 столбца.
 Ширина столбцов одинаковая и равна половине ширины экрана за вычетом отступов.
 Первая фотография всегда ставится в левый столбец и имеет высоту равную 300.0
 Следующие фотографии выставляются в тот столбец, чья высота меньше и имеют высоту равную 200.0. Обратите внимание, что из-за другой высоты у первой ячейки фоторафии не будут по очереди добавляться то в первый столбец, то во второй. (Подсказка - порядок фото получается следующий: левый столбец, правый столбец, снова правый столбец, левый столбец, правый, левый, правый и дальше по очереди)
 При нажатии на фото ничего не должно происходить.
 
 
 */

import UIKit

class CollectionViewController: UIViewController {
  
  @IBOutlet weak var photoCollectionView: UICollectionView!
  
  //  MARK: Properties
  
  let photos = PhotoProvider().photos()
  let reuseIdentifier = "photoCell"
  let cellIdent = CGFloat(16)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let layout = photoCollectionView?.collectionViewLayout as? CustomFlowLayout {
      layout.delegate = self
    }
    
    ///    регистрирую ячейку
    self.photoCollectionView.register(UINib(nibName: String(describing: PhotoCollectionViewCell.self), bundle: nil),forCellWithReuseIdentifier: reuseIdentifier)
    
    photoCollectionView.contentInset = .init(top: 0,
                                             left: cellIdent,
                                             bottom: 0,
                                             right: cellIdent)
//    photoCollectionView.delegate = self
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

//MARK: Delegate Flow Layout

//extension CollectionViewController: UICollectionViewDelegateFlowLayout {
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    let itemSize = (collectionView.bounds.width - 3 * cellIdent) / 2
//
//    return CGSize(width: itemSize, height: itemSize)
//  }
extension CollectionViewController: PinterestLayoutDelegate {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
    let itemSize = (collectionView.bounds.width - 3 * cellIdent) / 2
//    photos[indexPath.item].image.size.height
    return itemSize
  }
  
  
  
  ///  минимальный межстрочный интервал для ячейки
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  /// расстояние между ячейками
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  
  
}
