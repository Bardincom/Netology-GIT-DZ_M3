//
//  UIViewPropertyAnimatorController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit
/*
 Следующий тип анимации - UIViewPropertyAnimator, которой соответствует UIViewPropertyAnimatorController.
 У этого контроллера имеется один аутлет animationView.
 Кроме того, на корневой view добавлен UIPanGestureRecognizer.
 Горизонтальное перемещение пальца по корневому view должно вызывать анимированное перемещение animationView вслед за пальцем.
 Перемещение должно происходить вдоль оси X с одновременным поворотом вокруг оси Z и изменением масштаба animationView.
 После удаления пальца с экрана возможны две ситуации:
 - если х-координата центра animationView меньше х-координаты центра корневого view, то animationView должен анимированно вернуться в первоначальное положение.
 - В противном случае animationView анимированно движется в конечную точку анимации.
 
 Подсказка: для определения центра animationView используйте свойство position presentation слоя.
 Параметры анимации следующие:
  - центр animationView должен переместиться вдоль оси Х на 300pt относительно своего первоначального положения,
  -  сам animationView должен повернуться на 180° вокруг оси Z по часовой стрелке и его масштаб должен увеличиться в 1.5 раза.
  - В качестве timingParameters нужно использовать UISpringTimingParameters со следующими значениями:
  - mass: 2.0,
  - stiffness: 30.0,
  - damping: 7.0,
  - initialVelocity: .zero.
 */

class UIViewPropertyAnimatorController: UIViewController {
    
    @IBOutlet weak var animationView: UIView!
    
    @IBAction func panGestureHandler(recognizer: UIPanGestureRecognizer) {
    }
  
  func fingerFollowing() {
    
  }
}
