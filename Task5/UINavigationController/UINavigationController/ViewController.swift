//
//  ViewController.swift
//  UINavigationController
//
//  Created by Aleksey Bardin on 14.02.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  
  private let date = Date()
  
  private let containerView: UIView = {
    let view = UIView()
    return view
  }()
  
  private var launchTimeLable: UILabel = {
    let label = UILabel()
    label.configureLable("Launch time:")
    return label
  }()
  
  private var resultLaunchTime: UILabel = {
    let label = UILabel()
    label.configureLable("resultLaunchTime")
    return label
  }()

  private var appearanceTimeLable: UILabel = {
    let label = UILabel()
    label.configureLable("Appearance Time:")
    return label
  }()

  private var resultAppearanceTime: UILabel = {
    let label = UILabel()
    label.configureLable("result Appearance")
    return label
  }()
  
  private var pushButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Push", for: .normal)
    button.sizeToFit()
    button.addTarget(self, action: #selector(switchSecondController(_:)), for: .touchUpInside)
    return button
  }()
  
  override var prefersStatusBarHidden: Bool {
     return true
   }
  
  //   MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    displayDate(resultLaunchTime)
    setNavigationItem()
    setupLayot()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    displayDate(resultAppearanceTime)
  }
}

// MARK: Extension + Helper
private extension ViewController {
  
  func setNavigationItem() {
    title = "Simple app"
    navigationItem.rightBarButtonItem = .init(title: "Update", style: .plain, target: self, action: #selector(pressUpdateButton(_:)))
  }
  
  func setupLayot() {

    [containerView, pushButton].forEach { view.addSubview($0) }
    
    [launchTimeLable, resultLaunchTime, appearanceTimeLable, resultAppearanceTime].forEach {containerView.addSubview($0)}
    
    containerView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(44)
      $0.bottom.trailing.leading.equalToSuperview()
    }
    
    pushButton.snp.makeConstraints {
      $0.bottom.equalToSuperview().offset(-32)
      $0.centerX.equalToSuperview()
    }
    
    launchTimeLable.snp.makeConstraints {
      $0.top.equalTo(containerView.snp.top).offset(16)
      $0.leading.equalToSuperview().offset(16)
    }
    
    resultLaunchTime.snp.makeConstraints {
      $0.top.equalTo(launchTimeLable.snp.bottom).offset(16)
      $0.leading.equalToSuperview().offset(16)
    }
    
    appearanceTimeLable.snp.makeConstraints {
      $0.top.equalTo(resultLaunchTime.snp.bottom).offset(32)
      $0.leading.equalToSuperview().offset(16)
    }
    
    resultAppearanceTime.snp.makeConstraints {
      $0.top.equalTo(appearanceTimeLable.snp.bottom).offset(16)
      $0.leading.equalToSuperview().offset(16)
    }
  }
  
  func displayDate(_ label: UILabel) {
    let displayDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    label.text = "\(dateFormatter.string(from: displayDate))"
  }
  
  @objc func switchSecondController(_ sender: UITapGestureRecognizer){
    let secondViewController = SecondViewController()
    navigationController?.pushViewController(secondViewController, animated: true)
  }
  
  @objc func pressUpdateButton(_ sender: UITapGestureRecognizer) {
    displayDate(resultAppearanceTime)
  }
}

