//
//  CAKeyframeAnimationController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CAKeyframeAnimationController: UIViewController {
  
  @IBOutlet weak var passcodeTextField: UITextField!
  @IBOutlet weak var orangeView: UIView!
  @IBOutlet weak var startShakeAnimationButton: UIButton!
  @IBOutlet weak var startSinAnimationButton: UIButton!
  
  @IBAction func shakeAnimationTapHandler(sender: UIButton) {
    wrongPasswordAnimation()
  }
  
  @IBAction func sinAnimationTapHandler(sender: UIButton) {
    sinusoidalMotionAnimation()
  }
  
  // MARK: - Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    showSinPath()
  }
  
  private func wrongPasswordAnimation() {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.values = [0, 10, -10, 10, -5, 5, -5, 0]
    animation.keyTimes = [0, 0.125, 0.25, 0.375, 0.5, 0.625, 0.8, 1]
    animation.duration = 0.4
    animation.isAdditive = true
    passcodeTextField.layer.add(animation, forKey: nil)
  }
  
  private func sinusoidalMotionAnimation() {
    let moveAnimation = CAKeyframeAnimation(keyPath: "position")
    moveAnimation.path = sinPath()
    moveAnimation.duration = 6
    moveAnimation.repeatCount = .infinity
    moveAnimation.calculationMode = .paced
    moveAnimation.rotationMode = .rotateAuto
    orangeView.layer.add(moveAnimation, forKey: nil)
  }
  
}

extension CAKeyframeAnimationController {
  private func showSinPath() {
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = sinPath()
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.strokeColor = UIColor.black.cgColor
    view.layer.addSublayer(shapeLayer)
  }
  
  private func sinPath() -> CGPath {
    let startPoint = orangeView.center
    let width = self.view.bounds.width - 2 * startPoint.x
    let height = self.view.bounds.height / 6.0
    return CGPath.sinPath(startPoint: startPoint, width: width, height: height, periods: 1.5)
  }
}
