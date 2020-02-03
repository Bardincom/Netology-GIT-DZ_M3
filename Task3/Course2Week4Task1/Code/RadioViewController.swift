//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
  
  //  MARK: Properties
  
  let albumImage = UIImage(named: "Aerosmith")
  let musicTrack: (groupName: String, trackName: String) = ("Aerosmith", "Hole In My Soul")
  let startingValuesSliders: Float = 0.5
  let fontTrackText: UIFont = .systemFont(ofSize: 22, weight: .medium)
  let colorTrackText: UIColor = .black
  var orientation: UIInterfaceOrientation = .portrait
  let size = UIScreen.main.bounds.size
  var regularConstraints: [NSLayoutConstraint] = []
  var compactConstraints: [NSLayoutConstraint] = []
  
  //  MARK: UI Elements
  
  lazy var albumCover: UIImageView = {
    var imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView = UIImageView(image: albumImage)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var audioProgress: UIProgressView = {
    var progressView = UIProgressView()
    progressView = .init(progressViewStyle: .bar)
    progressView.progress = startingValuesSliders
    progressView.translatesAutoresizingMaskIntoConstraints = false
    return progressView
  }()
  
  lazy var volumeSlider: UISlider = {
    var slider = UISlider()
    slider.value = startingValuesSliders
    slider.translatesAutoresizingMaskIntoConstraints = false
    return slider
  }()
  
  lazy var track: UILabel = {
    var lable = UILabel()
    lable.font = fontTrackText
    lable.textColor = colorTrackText
    lable.textAlignment = .center
    lable.numberOfLines = 1
    lable.text = musicTrack.groupName + " - " + musicTrack.trackName
    lable.translatesAutoresizingMaskIntoConstraints = false
    return lable
  }()
  
  //  MARK: viewDidLoad
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addSubviews()
    configureConstraints()
    settingInitialConstrains()
    print("viewDidLoad")
    print(coordLable())
  }
 
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("viewWillAppear")
    print(coordLable())
  }
  override func viewWillLayoutSubviews() {
    print("viewWillLayoutSubviews")
    print(coordLable())
  }
  
  override func updateViewConstraints() {
    print("updateViewConstraints")
    print(coordLable())
    super.updateViewConstraints()
  }
  override func viewDidLayoutSubviews() {
    print("viewDidLayoutSubviews")
    print(coordLable())
   
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print("viewDidAppear")
    print(coordLable())
   
  }
  

  
  //  MARK: traitCollectionDidChange
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    
    if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
      if regularConstraints.count > 0 && regularConstraints[0].isActive {
        NSLayoutConstraint.deactivate(regularConstraints)
      }
      
      NSLayoutConstraint.activate(compactConstraints)
      
    } else {
      if compactConstraints.count > 0 && compactConstraints[0].isActive {
        NSLayoutConstraint.deactivate(compactConstraints)
      }
      
      NSLayoutConstraint.activate(regularConstraints)
    }
  }
  
  private func addSubviews() {
    view.addSubview(albumCover)
    view.addSubview(audioProgress)
    view.addSubview(volumeSlider)
    view.addSubview(track)
    
  }
  
  func configureConstraints() {
    compactConstraints.append(contentsOf: configurePortreitConstrain())
    regularConstraints.append(contentsOf: configureLandscapeConstraints())
  }
  
  
  
}



