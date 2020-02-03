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
      albumCover.heightAnchor.constraint(equalTo: albumCover.widthAnchor, multiplier: 1.0),
      albumCover.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
      albumCover.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      albumCover.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
      
      audioProgress.topAnchor.constraint(equalTo: albumCover.bottomAnchor, constant: 30.0),
      audioProgress.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      audioProgress.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      
      volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      volumeSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
      volumeSlider.heightAnchor.constraint(equalToConstant: 31),
      
//      track.topAnchor.constraint(equalTo: audioProgress.bottomAnchor, constant: 75.0),
      track.topAnchor.constraint(equalTo: audioProgress.bottomAnchor, constant: ( (audioProgress.frame.maxY) + (volumeSlider.frame.maxY) )/2),
      track.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0.0),
      track.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      track.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0)
    ]
  }
  
  // MARK: Landscape Constrains
  
  func configureLandscapeConstraints() -> [NSLayoutConstraint] {
    return [
      albumCover.heightAnchor.constraint(equalTo: albumCover.widthAnchor, multiplier: 1.0),
      albumCover.topAnchor.constraint(equalTo: audioProgress.topAnchor, constant: 16.0),
      albumCover.bottomAnchor.constraint(equalTo: volumeSlider.topAnchor, constant: -16.0),
      albumCover.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      albumCover.trailingAnchor.constraint(equalTo: track.leadingAnchor, constant: -16.0),
      
      volumeSlider.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      volumeSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      volumeSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24.0),
      volumeSlider.heightAnchor.constraint(equalToConstant: 31),
      
      audioProgress.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16.0),
      audioProgress.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16.0),
      audioProgress.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
      
      track.topAnchor.constraint(equalTo: audioProgress.bottomAnchor, constant: ((audioProgress.frame.maxY) + (volumeSlider.frame.maxY))/2),

      track.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16.0),
    ]
  }
  
  
  func coordLable() -> CGFloat {
    return (audioProgress.frame.maxY + volumeSlider.frame.maxY)/2
   }
}
