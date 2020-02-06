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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let gesture = UITapGestureRecognizer(target: self,
                                         action:  #selector (self.tapView(_:)))
    orangeView.addGestureRecognizer(gesture)
  }
  
  private func changeCornerRadiusSquare() {
    
    let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
    animation.duration = 1
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    orangeView.layer.cornerRadius = 50
    orangeView.layer.add(animation, forKey: "cornerRadius")
  }
  
  @objc func tapView(_ sender: UITapGestureRecognizer){
    changeCornerRadiusSquare()
  }
  
  
}
