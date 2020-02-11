//
//  CATransitionController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

/*
 Следующий тип анимации - CATransition, которой соответствует CATransitionController.
 У этого контроллера имеется один аутлет textLabel с текстом “Initial text” оранжевого цвета.
 Нужно сделать так, чтобы по свайпу в корневом view слева направо текст анимированно менялся на “Sliding!” со следующими параметрами:
 transition type - kCATransitionMoveIn,
 цвет текста .green,
 длительность анимации - 1 секунда,
 timingFunction - kCAMediaTimingFunctionEaseOut.
 По окончании этой анимации текст должен анимированно поменяться на первоначальный, параметры этой анимации следующие:
 transition type - kCATransitionFade,
 цвет текста .orange,
 длительность анимации - 1 секунда,
 timingFunction - kCAMediaTimingFunctionEaseOut.
 
 */
class CATransitionController: UIViewController {
  
  @IBOutlet weak var textLabel: UILabel!
  
  @IBAction func swipeHandler(_ sender: UISwipeGestureRecognizer) {
    self.changeTextAnimation()
  }
  
  private func changeTextAnimation() {
    let swipeAnimation = CATransition()
    swipeAnimation.delegate = self
    swipeAnimation.duration = 1
    swipeAnimation.type = .moveIn
    swipeAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
    textLabel.textColor = .green
    textLabel.text = "Sliding!"
    textLabel.layer.add(swipeAnimation, forKey: nil)
  }
  
}

//MARK: CAAnimationDelegate
extension CATransitionController: CAAnimationDelegate {
  func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
     let swipeAnimation = CATransition()
     swipeAnimation.duration = 1
     swipeAnimation.type = .fade
     swipeAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
     textLabel.textColor = .orange
     textLabel.text = "Initial text"
     textLabel.layer.add(swipeAnimation, forKey: nil)
   }
}
