//
//  ViewController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit


/*
 Первый тип анимации - CABasicAnimation, которой соответствует CABasicAnimationController. У этого контроллера имеется 4 UIView аутлета разных цветов: оранжевого, бирюзового, синего и зелёного. Тап по каждому из этих views запускает свою анимацию типа CABasicAnimation:
 
 orangeView должен анимированно превратиться в окружность. Длительность анимации - одна секунда, timingFunction - kCAMediaTimingFunctionEaseOut, после окончания анимации view должен оставаться окружностью.
 
 cyanView должен стать невидимым. Длительность анимации - одна секунда, timingFunction - kCAMediaTimingFunctionEaseIn, после окончания анимации view должен оставаться невидимым.
 
 blueView должен переместиться вдоль оси Х. Конечное значение x - координаты его центра - аналогичная координата центра cyanView. Одновременно с этим blueView должен повернуться на 315° по часовой стрелке вокруг оси Z. Длительность обеих анимаций - две секунды, timingFunction - kCAMediaTimingFunctionEaseInEaseOut. По окончании анимации blueView должен сохранять это состояние.
 
 greenView должен переместиться из своего начального положения в центр родительского view. Одновременно с этим его масштаб должен увеличиться в 1.5 раза по обеим осям (X и Y) и background color должен стать magenta. После завершения этих анимаций greenView должен анимированно вернуться в исходное состояние. Цикл должен повториться два раза. Длительность одного цикла анимаций - одна секунда, timingFunction -kCAMediaTimingFunctionEaseInEaseOut.
 */

class CABasicAnimationController: UIViewController {
  
  @IBOutlet weak var orangeView: UIView!
  @IBOutlet weak var cyanView: UIView!
  @IBOutlet weak var blueView: UIView!
  @IBOutlet weak var greenView: UIView!
  
  let backgroundColorForGreenView = UIColor.magenta.cgColor
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gesture = UITapGestureRecognizer(target: self,
                                         action:  #selector (self.tapView(_:)))
//    orangeView.addGestureRecognizer(gesture)
//    cyanView.addGestureRecognizer(gesture)
//    blueView.addGestureRecognizer(gesture)
    greenView.addGestureRecognizer(gesture)
  }
  
  private func changeCornerRadiusSquare() {
    let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    orangeView.layer.cornerRadius = 50
    orangeView.layer.add(animation, forKey: nil)
  }
  
  private func makeSquareInvisible() {
    let animation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
    cyanView.layer.backgroundColor = .none
    cyanView.layer.add(animation, forKey: nil)
  }
  
  private func moveSquareAlongXAxis() {
    let point = CGPoint(x: cyanView.center.x, y: blueView.layer.position.y)
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 2
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    animation.fromValue = blueView.layer.position
    animation.toValue = point
    blueView.layer.add(animation, forKey: nil)
    blueView.layer.position = point
    
    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
    rotateAnimation.fillMode = .forwards
    rotateAnimation.isRemovedOnCompletion = false
    rotateAnimation.duration = 2
    rotateAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    rotateAnimation.fromValue = 0
    rotateAnimation.toValue = (315 * Float.pi) / 180
    blueView.layer.add(rotateAnimation, forKey: "position")
  }
  
///  greenView должен переместиться из своего начального положения в центр родительского view. Одновременно с этим его масштаб должен увеличиться в 1.5 раза по обеим осям (X и Y) и background color должен стать magenta. После завершения этих анимаций greenView должен анимированно вернуться в исходное состояние. Цикл должен повториться два раза. Длительность одного цикла анимаций - одна секунда, timingFunction -kCAMediaTimingFunctionEaseInEaseOut.
  private func performMoveAnimation() {
    let point = view.center
    let scaleValue: Float = 1.5
    let animation = CABasicAnimation(keyPath: "position")
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    animation.repeatCount = 2
    animation.autoreverses = true
    animation.fillMode = .backwards
    animation.toValue = point
    greenView.layer.add(animation, forKey: nil)
    
    let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
    colorAnimation.duration = 1
    colorAnimation.isRemovedOnCompletion = false
    colorAnimation.fillMode = .forwards
    colorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    colorAnimation.repeatCount = 2
    colorAnimation.autoreverses = true
    greenView.layer.backgroundColor = backgroundColorForGreenView
    greenView.layer.add(colorAnimation, forKey: nil)
    
    let sizeAnimation = CABasicAnimation(keyPath: "transform.scale")
    sizeAnimation.duration = 1
    sizeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    sizeAnimation.repeatCount = 2
    sizeAnimation.autoreverses = true
    sizeAnimation.fromValue = 1.0
    sizeAnimation.toValue = scaleValue
    greenView.layer.add(sizeAnimation, forKey: nil)
    
  }
 
  
  @objc func tapView(_ sender: UITapGestureRecognizer){
    print("Нажатие")
//      changeCornerRadiusSquare()
//makeSquareInvisible()
//    moveSquareAlongXAxis()
performMoveAnimation()
    
  }
  
  
}
