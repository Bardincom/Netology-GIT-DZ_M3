//
//  CustomFlowLayout.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate: AnyObject {
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class CustomFlowLayout: UICollectionViewLayout {
/// 1. Это сохраняет ссылку на делегата.
  weak var delegate: PinterestLayoutDelegate?

  /// 2. Это два свойства для настройки макета: количество столбцов и заполнение ячейки.
  private let numberOfColumns = 2
  private let cellPadding: CGFloat = 1

  /// 3 Это массив для кэширования вычисляемых атрибутов. Когда вы вызываете prepare (), вы вычисляете атрибуты для всех элементов и добавляете их в кеш. Когда представление коллекции позднее запрашивает атрибуты макета, вы можете эффективно запрашивать кэш, а не каждый раз пересчитывать их.
  private var cache: [UICollectionViewLayoutAttributes] = []

  /// 4. Это объявляет два свойства для хранения размера контента. Вы увеличиваете contentHeight по мере добавления фотографий и вычисляете contentWidth на основе ширины представления коллекции и вставки ее содержимого.
  private var contentHeight: CGFloat = 0

  private var contentWidth: CGFloat {
    guard let collectionView = collectionView else {
      return 0
    }
    let insets = collectionView.contentInset
    return collectionView.bounds.width - (insets.left + insets.right)
  }

  // 5. collectionViewContentSize возвращает размер содержимого представления коллекции. Вы используете contentWidth и contentHeight из предыдущих шагов для расчета размера.
  override var collectionViewContentSize: CGSize {
    return CGSize(width: contentWidth, height: contentHeight)
  }
  
  override func prepare() {
    /// 1 Атрибуты макета вычисляются только в том случае, если кэш пуст и представление коллекции существует.
    guard
      cache.isEmpty == true,
      let collectionView = collectionView
      else {
        return
    }
    /// 2 Объявите и заполните массив xOffset координатой x для каждого столбца на основе ширины столбца. Массив yOffset отслеживает y-позицию для каждого столбца. Каждое значение в yOffset вы инициализируете равным 0, поскольку это смещение первого элемента в каждом столбце.
    let columnWidth = contentWidth / CGFloat(numberOfColumns)
       
    var xOffset: [CGFloat] = []
    for column in 0..<numberOfColumns {
      xOffset.append(CGFloat(column) * columnWidth)
    }
    var column = 0
    var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)
      
    /// 3 Просмотрите все элементы в первом разделе, так как этот конкретный макет имеет только один раздел.
    for item in 0..<collectionView.numberOfItems(inSection: 0) {
      let indexPath = IndexPath(item: item, section: 0)
        
      /// 4 Выполните расчет кадра. ширина - это ранее вычисленная ширина ячейки с удаленным заполнением между ячейками. Спросите у делегата высоту фотографии, затем вычислите высоту кадра на основе этой высоты и предварительно определенной ячейки для верхней и нижней частей.
      /// Если делегат не установлен, используйте высоту ячейки по умолчанию. Затем вы комбинируете это со смещением x и y текущего столбца, чтобы создать insetFrame, используемый атрибутом.
      let photoHeight = delegate?.collectionView(
        collectionView,
        heightForPhotoAtIndexPath: indexPath) ?? 180
      let height = cellPadding * 2 + photoHeight
      let frame = CGRect(x: xOffset[column],
                         y: yOffset[column],
                         width: columnWidth,
                         height: height)
      let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
        
      /// 5 Создайте экземпляр UICollectionViewLayoutAttributes, установите его кадр с помощью insetFrame и добавьте атрибуты в кэш.
      let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
      attributes.frame = insetFrame
      cache.append(attributes)
        
      /// 6 Разверните contentHeight, чтобы учесть фрейм вновь рассчитанного элемента. Затем продвиньте yOffset для текущего столбца, основываясь на кадре. Наконец, продвиньте столбец, чтобы следующий элемент был помещен в следующий столбец.
      contentHeight = max(contentHeight, frame.maxY)
      yOffset[column] = yOffset[column] + height
        
      column = column < (numberOfColumns - 1) ? (column + 1) : 0
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []
    
    // Loop through the cache and look for items in the rect
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
