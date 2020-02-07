//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CABasicAnimationController: UIViewController {
  
  @IBOutlet weak var orangeView: UIView!
  @IBOutlet weak var cyanView: UIView!
  @IBOutlet weak var blueView: UIView!
  @IBOutlet weak var greenView: UIView!
  
  private var backgroundColorForGreenView: CGColor {
   return UIColor.magenta.cgColor
  }
  
  private let angle: Float = 315
  
//  MARK: viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    
    allGusture()
  }
  
  private func calculateAngleRotation(_ angle: Float) -> Float {
    return (angle * Float.pi) / 180
  }
  
//  MARK: Animation Configuration
  private func changeCornerRadiusSquare() {
    let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    orangeView.layer.cornerRadius = 50
    orangeView.layer.add(animation, forKey: nil)
  }
  
  private func makeSquareInvisible() {
    let animation = CABasicAnimation(keyPath: "backgroundColor")
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
    cyanView.layer.backgroundColor = .none
    cyanView.layer.add(animation, forKey: nil)
  }
  
  private func moveSquareAlongXAxis() {
    let point = CGPoint(x: cyanView.center.x, y: blueView.layer.position.y)
    let moveAnimation = CABasicAnimation(keyPath: "position")
    moveAnimation.fromValue = blueView.layer.position
    moveAnimation.toValue = point

    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    rotateAnimation.fromValue = 0
    rotateAnimation.toValue = calculateAngleRotation(angle)
    
    let groupAnimation = CAAnimationGroup()
    groupAnimation.animations = [moveAnimation, rotateAnimation]
    groupAnimation.duration = 2
    groupAnimation.fillMode = .forwards
    groupAnimation.isRemovedOnCompletion = false
    groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    blueView.layer.add(groupAnimation, forKey: "groupAnimation")
     blueView.layer.position = point
  }
  
  private func performMoveAnimation() {
    let point = view.center
    let scaleValue: Float = 1.5

    let positionAnimation = CABasicAnimation(keyPath: "position")
    positionAnimation.toValue = point

    let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
    
    let sizeAnimation = CABasicAnimation(keyPath: "transform.scale")
    sizeAnimation.fromValue = 1.0
    sizeAnimation.toValue = scaleValue
    
    let groupAnimation = CAAnimationGroup()
    groupAnimation.animations = [positionAnimation, colorAnimation, sizeAnimation]
    groupAnimation.duration = 1
    groupAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    groupAnimation.repeatCount = 2
    groupAnimation.autoreverses = true
    groupAnimation.isRemovedOnCompletion = false
    groupAnimation.fillMode = .forwards
    greenView.layer.backgroundColor = backgroundColorForGreenView
    greenView.layer.add(groupAnimation, forKey: nil)
  }
  
}

// MARK: Activation View animations
private extension CABasicAnimationController {
  
  private func gesture(_ view: UIView, _ sender: Selector) {
    let gesture = UITapGestureRecognizer(target: self,
                                         action:  sender)
    view.addGestureRecognizer(gesture)
  }
  
  private func allGusture() {
    gesture(orangeView, #selector(tapOrangeView))
    gesture(cyanView, #selector(tapCyanView))
    gesture(blueView, #selector(tapBlueView))
    gesture(greenView, #selector(tapGreenView))
  }
  
  @objc func tapOrangeView(_ sender: UITapGestureRecognizer){
    changeCornerRadiusSquare()
  }
  
  @objc func tapCyanView(_ sender: UITapGestureRecognizer){
    makeSquareInvisible()
  }
  
  @objc func tapBlueView(_ sender: UITapGestureRecognizer){
    moveSquareAlongXAxis()
  }
  
  @objc func tapGreenView(_ sender: UITapGestureRecognizer){
    performMoveAnimation()
  }
  
}

