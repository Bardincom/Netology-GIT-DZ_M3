//
//  RadioViewController.swift
//  Course2Week4Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class RadioViewController: UIViewController {
  
  //  MARK: Properties
  
  let albumImage = UIImage(named: "Beatles")
  let musicTrack: (groupName: String, trackName: String) = ("Beatles", "A Day in the Life")
  let startingValuesSliders: Float = 0.5
  let fontTrackText: UIFont = .systemFont(ofSize: 22, weight: .medium)
  let colorTrackText: UIColor = .black
  var orientation: UIInterfaceOrientation = .portrait
  let size = UIScreen.main.bounds.size
  var regularConstraints: [NSLayoutConstraint] = []
  var compactConstraints: [NSLayoutConstraint] = []
  
  //  MARK: UI Elements
  
  lazy var albumCoverImage: UIImageView = {
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
    progressView.trackTintColor = .lightGray
    progressView.translatesAutoresizingMaskIntoConstraints = false
    return progressView
  }()
  
  lazy var volumeSlider: UISlider = {
    var slider = UISlider()
    slider.value = startingValuesSliders
    slider.translatesAutoresizingMaskIntoConstraints = false
    return slider
  }()
  
  lazy var trackNameLabel: UILabel = {
    var label = UILabel()
    label.font = fontTrackText
    label.textColor = colorTrackText
    label.textAlignment = .center
    label.numberOfLines = 1
    label.text = musicTrack.groupName + " - " + musicTrack.trackName
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  //  MARK: viewDidLoad
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    addSubviews()
    configureConstraints()
    setInitialConstrains()
  }
 
  //  MARK: traitCollectionDidChange
  
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    
//    guard traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular else {
//      guard !compactConstraints.isEmpty && compactConstraints.first?.isActive != nil else {
//        return
//      }
//      NSLayoutConstraint.deactivate(compactConstraints)
//      NSLayoutConstraint.activate(regularConstraints)
//      return
//    }
//
//    guard !regularConstraints.isEmpty && regularConstraints.first?.isActive != nil else {
//      return
//    }
//    NSLayoutConstraint.deactivate(regularConstraints)
//    NSLayoutConstraint.activate(compactConstraints)
    
    if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {

      if !regularConstraints.isEmpty && regularConstraints.first?.isActive != nil {
        NSLayoutConstraint.deactivate(regularConstraints)
      }

      NSLayoutConstraint.activate(compactConstraints)

    } else {
      if !compactConstraints.isEmpty && compactConstraints.first?.isActive != nil {
        NSLayoutConstraint.deactivate(compactConstraints)
      }

      NSLayoutConstraint.activate(regularConstraints)
    }
  }
  
  private func addSubviews() {
    view.addSubview(albumCoverImage)
    view.addSubview(audioProgress)
    view.addSubview(volumeSlider)
    view.addSubview(trackNameLabel)
  }
  
  private func configureConstraints() {
    compactConstraints.append(contentsOf: configurePortraitConstraints())
    regularConstraints.append(contentsOf: configureLandscapeConstraints())
  }
  
}

