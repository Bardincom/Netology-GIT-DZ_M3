//
//  ViewController.swift
//  UINavigationController
//
//  Created by Aleksey Bardin on 14.02.2020.
//  Copyright © 2020 Aleksey Bardin. All rights reserved.
//

import UIKit
import SnapKit

//В этом задании вам нужно создать простую иерархию контроллеров. Для начала создайте новый проект и настройте его согласно общим требованиям. Единственное отличие - нужно скрыть status bar.
//
//Приложение должно состоять из UINavigationController, и двух контроллеров. Изначально в стеке только первый. Второй должен отображаться при нажатии на кнопку Push.
//
//На первом контроллере должно отображаться время запуска приложения и время появления этого контроллера на экране. Т.е. при возвращении со второго контроллера на первый это время должно обновляться. Тоже самое должно происходить при нажатии на кнопку Update в навигейшн баре.
//Отступы для элементов указаны на макете для iPhone SE. Для других девайсов отступы те же самые.
//
//Цвет текста в лейблах - черный, шрифт - System font 17. Шрифт в кнопках стандартный.



class ViewController: UIViewController {
  
  let containerView: UIView = {
    let view = UIView()
    return view
  }()
  
  private var launchTimeLable: UILabel = {
    let lable = UILabel()
    lable.font = .systemFont(ofSize: 17)
    lable.text = "Launch time:"
    lable.textColor = .black
    lable.backgroundColor = .yellow
    return lable
  }()
  
  private var resultLaunchTime: UILabel = {
    let lable = UILabel()
    lable.font = .systemFont(ofSize: 17)
    lable.text = "resultLaunchTime"
    lable.textColor = .black
    lable.backgroundColor = .yellow
    return lable
  }()

  private var appearanceTimeLable: UILabel = {
    let lable = UILabel()
    lable.font = .systemFont(ofSize: 17)
    lable.text = "Appearance Time"
    lable.textColor = .black
    lable.backgroundColor = .blue
    return lable
  }()

  private var resultAppearanceTime: UILabel = {
    let lable = UILabel()
    lable.font = .systemFont(ofSize: 17)
    lable.text = "result Appearance"
    lable.textColor = .black
    lable.backgroundColor = .blue
    return lable
  }()
  
  private var pushButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Push", for: .normal)
    button.sizeToFit()
    button.backgroundColor = .green
    button.addTarget(self, action: #selector(switchSecondController(_:)), for: .touchUpInside)
    return button
  }()
  
  //   MARK: Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = "Simple app"
   
    setupLayot()
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
}

// MARK: Extension + Helper
private extension ViewController {
  
//  func createLable(_ text: String) -> UILabel {
//    let lable = UILabel()
//    lable.font = .systemFont(ofSize: 17)
//    lable.text = text
//    return lable
//  }
  
  func setupLayot() {
     view.addSubview(containerView)
     view.addSubview(pushButton)
    
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
  
  @objc func switchSecondController(_ sender: UITapGestureRecognizer){
    let secondViewController = SecondViewController()
    navigationController?.pushViewController(secondViewController, animated: true)
  }
}

extension UILabel {
  func createLable(_ text: String) -> UILabel {
    let lable = UILabel()
    lable.font = .systemFont(ofSize: 17)
    lable.text = text
    return lable
  }
}
