//
//  UIViewAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewAnimationController: UIViewController {
  
  @IBOutlet weak var animationView: UIView!
  @IBOutlet weak var flipButton: UIButton!
  
  @IBAction func animationViewTapHandler(sender: UITapGestureRecognizer) {
    moveAlongAxisX()
  }
  
  @IBAction func flipButtonTapHandler(sender: UIButton) {
    flipView()
  }
  
  private func moveAlongAxisX() {
    UIView.animate(withDuration: 1, delay: 0.5, options: [.curveEaseInOut], animations: {
      self.animationView.layer.position.x = self.calculatePositionX()
      self.animationView.transform = CGAffineTransform(rotationAngle: .pi)
    }, completion: nil)
  }
  
  private func flipView() {
    UIView.transition(with: view, duration: 1, options: [.curveEaseInOut], animations: {
      
      if self.view.transform == .init(rotationAngle: 0) {
        self.viewTransformRotation(.pi)
      } else if self.view.transform == .init(rotationAngle: .pi) {
        self.viewTransformRotation(.pi * 2)
      } else {
        self.viewTransformRotation(.pi)
      }
      
    }, completion: nil)
  }
}

// MARK: Extension
private extension UIViewAnimationController {
  
  func calculatePositionX() -> CGFloat {
    return self.view.frame.width - (self.animationView.frame.width / 2)
  }
  
  func viewTransformRotation(_ angle: CGFloat) {
    self.view.transform = .init(rotationAngle: angle)
    self.flipButton.transform = .init(rotationAngle: angle)
    self.animationView.layer.position.x = self.calculatePositionX()
  }
}
