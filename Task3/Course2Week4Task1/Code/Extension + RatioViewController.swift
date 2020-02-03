//
//  Extension + RatioViewController.swift
//  Course2Week4Task1
//
//  Created by Aleksey Bardin on 03.02.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

extension RadioViewController {
  
  func settingInitialConstrains() {
    if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
      NSLayoutConstraint.activate(compactConstraints)
    } else {
      NSLayoutConstraint.activate(regularConstraints)
    }
  }
  
  
  //  MARK: Portrait Constrains
  
  func configurePortreitConstrain() -> [NSLayoutConstraint] {
    return [
      albumCoverImage.heightAnchor.constraint(equalTo: albumCoverImage.widthAnchor, multiplier: 1.0),
      albumCoverImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
      albumCoverImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      albumCoverImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
      
      audioProgress.topAnchor.constraint(equalTo: albumCoverImage.bottomAnchor, constant: 30.0),
      audioProgress.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      audioProgress.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),

      volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      volumeSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
      volumeSlider.heightAnchor.constraint(equalToConstant: 31),

      trackNameLable.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
      trackNameLable.topAnchor.constraint(equalTo: audioProgress.bottomAnchor),
      trackNameLable.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor),
      trackNameLable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      trackNameLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
    ]
  }
  
  // MARK: Landscape Constrains
  
  func configureLandscapeConstraints() -> [NSLayoutConstraint] {
    return [
      albumCoverImage.heightAnchor.constraint(equalTo: albumCoverImage.widthAnchor, multiplier: 1.0),
      albumCoverImage.topAnchor.constraint(equalTo: audioProgress.topAnchor, constant: 16.0),
      albumCoverImage.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor, constant: -16.0),
      albumCoverImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      albumCoverImage.trailingAnchor.constraint(equalTo: trackNameLable.leadingAnchor, constant: -16.0),
      
      volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      volumeSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
      volumeSlider.heightAnchor.constraint(equalToConstant: 31),
      
      audioProgress.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
      audioProgress.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      audioProgress.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      
      trackNameLable.topAnchor.constraint(equalTo: audioProgress.bottomAnchor),
      trackNameLable.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor),
      trackNameLable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
    ]
  }
  
  
}
