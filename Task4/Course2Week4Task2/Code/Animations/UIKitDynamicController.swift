//
//  UIKitDynamicController.swift
//  Course2Week4Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class UIKitDynamicController: UIViewController {
  
  @IBOutlet weak var anchorView: UIView!
  @IBOutlet weak var animationView: UIView!
  var attachmentBehavior: UIAttachmentBehavior!
  var dynamicAnimator: UIDynamicAnimator!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    freeVibrationAnimation()
    
    let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer(_:)))
    anchorView.addGestureRecognizer(gesture)
  }
  
  private func freeVibrationAnimation() {
    dynamicAnimator = UIDynamicAnimator(referenceView: view)
    
    let gravity = UIGravityBehavior(items: [animationView])
    
    attachmentBehavior = UIAttachmentBehavior(item: animationView, attachedToAnchor: anchorView.center)
    attachmentBehavior.length = anchorView.layer.position.x / 2 + animationView.layer.position.x / 2
    
    dynamicAnimator.addBehavior(attachmentBehavior)
    dynamicAnimator.addBehavior(gravity)
  }
  
  @objc func panGestureRecognizer(_ recognizer: UIPanGestureRecognizer) {
    attachmentBehavior.anchorPoint = recognizer.location(in: view)
    anchorView.center = attachmentBehavior.anchorPoint
  }
}
