//
//  CustomFlowLayout.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

protocol CustomLayoutDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class CustomFlowLayout: UICollectionViewLayout {
  
  weak var delegate: CustomLayoutDelegate?
  private let numberOfColumns = 2
  private let cellPadding: CGFloat = 8
  private var cache: [UICollectionViewLayoutAttributes] = []
  private var contentHeight: CGFloat = 0
  
  private var contentWidth: CGFloat {
    guard let collectionView = collectionView else {
      return 0
    }
    let insets = collectionView.contentInset
    return collectionView.bounds.width - (insets.left + insets.right)
  }
  
  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
  override func prepare() {
    guard
      cache.isEmpty == true,
      let collectionView = collectionView
      else {
        return
    }
    
    let columnWidth = contentWidth / CGFloat(numberOfColumns)
    var xOffset: [CGFloat] = []
    for column in 0..<numberOfColumns {
      xOffset.append(CGFloat(column) * columnWidth)
    }
    var column = 0
    var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
    
    for item in 0..<collectionView.numberOfItems(inSection: 0) {
      func heightSet(_ columnNumber: Int) {
          let indexPath = IndexPath(item: item, section: 0)
          let photoHeight: CGFloat = item == 0 ? 300 : 200
          let height = cellPadding * 2 + photoHeight
          let frame = CGRect(x: xOffset[columnNumber],
                              y: yOffset[columnNumber],
                              width: columnWidth,
                              height: height)

           let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)

           let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
           attributes.frame = insetFrame
           cache.append(attributes)

           contentHeight = max(contentHeight, frame.maxY)
           yOffset[columnNumber] = yOffset[columnNumber] + height

              column = column < (numberOfColumns - 1) ? (column + 1) : 0 }
          
          if yOffset[0] > yOffset[1] {
              heightSet(1)
          } else {heightSet(0)}
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
    
    for attributes in cache {
      if attributes.frame.intersects(rect) {
        visibleLayoutAttributes.append(attributes)
      }
    }
    return visibleLayoutAttributes
  }
  
  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
     return cache[indexPath.item]
   }
}
