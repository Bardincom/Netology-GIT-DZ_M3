//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIViewPropertyAnimatorController: UIViewController {
  
  @IBOutlet weak var animationView: UIView!
  
  var animator = UIViewPropertyAnimator()
  
  let timingParameters: UISpringTimingParameters = .init(mass: 2.0,
                                                         stiffness: 30.0,
                                                         damping: 7.0,
                                                         initialVelocity: .zero)
  
  @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
    fingerFollowing(recognizer)
  }
  
  func fingerFollowing(_ recognizer: UIPanGestureRecognizer) {
    switch recognizer.state{
      case .began:
        animator = UIViewPropertyAnimator(duration: 0,
                                          timingParameters: timingParameters)
        
        self.animationView.transform = .init(rotationAngle: .pi)
        
        animator.addAnimations {
          self.animationView.layer.position.x += 300
          self.animationView.transform = .init(scaleX: 1.5, y: 1.5)
        }
        
        animator.pauseAnimation()
      case .changed:
        animator.fractionComplete = recognizer.translation(in: view).x / view.bounds.size.width
      case .ended:
        if self.animationView.layer.position.x < self.view.center.x {
          animator.isReversed = false
        } else {
          animator.isReversed = true
        }
        
        animator.startAnimation()
      default:
        ()
    }
  }
}
